# ==============================================================================
# app - controllers - concerns - admin authable
# ==============================================================================
module AdminAuthable
  extend ActiveSupport::Concern

  included do
    alias_method :current_user, :current_resource

    if respond_to?(:helper_method)
      helper_method :current_user
    end
  end

  def resource_class
    Admin
  end

  def after_sign_in_path
    send("#{namespace.downcase}_root_path")
  end

  protected

  def current_resource
    @current_resource ||= resource_class.find(session[:"#{resouce_name}_id"])
  rescue ActiveRecord::RecordNotFound
    sign_out!
  end

  def sign_out!
    session[:"#{resouce_name}_id"] = nil
    session[:"#{resouce_name}_authenticated"] = nil
  end

  def authenticate!
    unless resource
      redirect_to send("#{namespace.downcase}_new_session_path")
    end
  end

  private

  def namespace
    self.class.parent.to_s.split('::').first
  end

  def resouce_name
    resource_class.name.underscore
  end

  def resource
    @resource ||= resource_class.find_by(id: session[:"#{resouce_name}_id"])
  end

  def authenticated?
    resource && session[:"#{resouce_name}_authenticated"] == true
  end
end
