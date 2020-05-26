# ==============================================================================
# app - controllers - management - system admins controller
# ==============================================================================
module Management
  class AdminsController < Management::ApplicationController
    before_action :set_admin, only: [:edit, :update, :destroy]

    def index
      @pagy, @admins = pagy Admin.all
    end

    def new
      @admin = Admin.new
    end

    def create
      @admin = Admin.new(admin_params)

      if @admin.save(context: :password_requred)
        redirect_to management_admins_path, notice: '管理者アカウントを作成しました。'
      else
        render :new
      end
    end

    def edit; end

    def update
      if @admin.update(admin_params)
        redirect_to management_admins_path, notice: '管理者アカウントを更新しました。'
      else
        render :edit
      end
    end

    def destroy
      if @admin == current_admin
        redirect_to management_admins_path, alert: '自分のアカウントは削除できません'
        return
      end

      @admin.destroy
      redirect_to management_admins_path, notice: '管理者アカウントを削除しました。'
    end

    private

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params.fetch(:admin, {}).permit(
        :name,
        :email,
        :password,
        :password_confirmation,
      )
    end
  end
end
