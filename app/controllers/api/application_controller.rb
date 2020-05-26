# ==============================================================================
# app - controllers - api - application controller
# ==============================================================================
module API
  class ApplicationController < ActionController::API
    include ExceptionRescuable
  end
end
