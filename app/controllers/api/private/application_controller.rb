# ==============================================================================
# app - controllers - api - private - application controller
# ==============================================================================
module API::Private
  class ApplicationController < API::ApplicationController
    include UserAuthable
    before_action :authenticate
  end
end
