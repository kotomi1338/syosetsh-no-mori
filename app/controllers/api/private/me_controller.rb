# ==============================================================================
# app - controllers - api - private - me controller
# ==============================================================================
module API::Private
  class MeController < ApplicationController
    def show
      render json: CurrentUserSerializer.new(current_user)
    end
  end
end
