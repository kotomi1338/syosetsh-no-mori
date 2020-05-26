# ==============================================================================
# app - controllers - management - accounts controller
# ==============================================================================
module Management
  class AccountsController < Management::ApplicationController
    before_action :set_account

    def edit; end

    def update
      if @account.update(admin_params)
        redirect_to edit_management_account_path, notice: 'アカウント情報を更新しました。'
      else
        render :edit
      end
    end

    def password
      if @account.update_password(password_params)
        redirect_to edit_management_account_path, notice: 'パスワードを更新しました。'
      else
        render :edit
      end
    end

    private

    def set_account
      @account = current_user
    end

    def admin_params
      params.fetch(:admin, {}).permit(
        :name,
        :email,
      )
    end

    def password_params
      params.fetch(:admin, {}).permit(
        :password,
        :password_confirmation,
        :current_password,
      )
    end
  end
end
