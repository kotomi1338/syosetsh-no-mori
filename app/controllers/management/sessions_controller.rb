# ==============================================================================
# app - controllers - management - sessions controller
# ==============================================================================
module Management
  class SessionsController < Management::ApplicationController
    include SessionUseable
    layout 'management/sign_in'
  end
end
