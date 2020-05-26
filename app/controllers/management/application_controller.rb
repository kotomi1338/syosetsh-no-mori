# ==============================================================================
# app - controllers - management - application controller
# ==============================================================================
module Management
  class ApplicationController < ActionController::Base
    include AdminAuthable
    include Pagy::Backend
    before_action :authenticate!

    layout 'management/application'
  end
end
