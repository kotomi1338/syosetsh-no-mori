# ==============================================================================
# app - controllers - concerns - session useable
# ==============================================================================
module SessionUseable
  extend ActiveSupport::Concern

  included do
    skip_before_action :authenticate!, only: [:new, :create, :destroy]
  end

  def new
    self.instance_variable_set(:"@#{resouce_name}", resource_class.new)
    redirect_to after_sign_in_path, notice: '既にログインしています' if current_resource
  end

  def create
    return redirect_to after_sign_in_path, notice: '既にログインしています' if current_resource

    resource = resource_class.find_by(email: resource_params[:email])

    if resource&.authenticate(resource_params[:password])
      session[:"#{resouce_name}_id"] = resource.id
      redirect_to after_sign_in_path
    else
      resource = resource_class.new(email: resource_params[:email])
      self.instance_variable_set(:"@#{resouce_name}", resource)
      flash.now[:alert] = 'ログインに失敗しました'
      sign_out!
      render 'new'
    end
  end

  def destroy
    sign_out!
    redirect_to send("#{namespace.downcase}_new_session_path"), notice: 'ログアウトしました'
  end

  private

  def resource_params
    params.require(resouce_name.to_sym).permit(
      :email,
      :password,
    )
  end
end
