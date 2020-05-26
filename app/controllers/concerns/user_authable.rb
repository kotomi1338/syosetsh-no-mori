# ==============================================================================
# app - controllers - concerns - user authable
# ==============================================================================
require 'ignore_must_revalidate'

module UserAuthable
  extend ActiveSupport::Concern

  JWT_REQUEST_PATTERN = /\ABearer [a-zA-Z0-9\-_=]+\.[a-zA-Z0-9\-_=]+\.[a-zA-Z0-9\-_=]*\z/.freeze

  included do
    if respond_to?(:helper_method)
      helper_method :current_user
    end
  end

  def current_user
    @current_user ||= begin
      User.find_or_create_by!(firebase_uid: current_user_uid)
    rescue ActiveRecord::RecordNotUnique
      retry
    end
  end

  def authenticate
    return if valid_decoded_token.present?

    handle_401 error_details: ['Please sign in']
  end

  def valid_decoded_token
    @valid_decoded_token ||= begin
      kid               = decoded_token[1]['kid']
      public_key        = OpenSSL::X509::Certificate.new(public_keys[kid]).public_key if kid
      validation_needed = !Rails.env.development?

      valid_decoded_token = JWT.decode(
        token,
        public_key,
        validation_needed,
        algorithm: 'RS256',
        verify_aud: true,
        aud: firebase_jwt_config['aud'],
        verify_iss: true,
        iss: firebase_jwt_config['iss'],
      )

      valid_decoded_token
    rescue JWT::ExpiredSignature
      handle_401 error_details: ['認証トークンが期限切れです']
    rescue JWT::DecodeError
      handle_401 error_details: ['不正なトークンです']
    rescue
      handle_500
    end
  end

  private

  def firebase_jwt_config
    @firebase_jwt_config ||= Settings.firebase.jwt_config
  end

  def current_user_uid
    @valid_decoded_token&.first&.[]('sub')
  end

  def token
    @token ||= begin
      token = request.headers['Authorization']
      return nil unless token.present? && !(token =~ JWT_REQUEST_PATTERN).nil?

      token = token.slice(7..-1)
      token
    end
  end

  def decoded_token
    @decoded_token ||= JWT.decode token, nil, false
  end

  def public_keys
    @public_keys ||= JSON.parse(http_client.get.body)
  end

  def http_client
    url = firebase_jwt_config['public_keys_endpoint']
    @http_client ||= Faraday.new(url) do |builder|
      builder.use :http_cache, store: Rails.cache
      builder.use IgnoreMustRevalidate
      builder.adapter Faraday.default_adapter
    end
  end
end
