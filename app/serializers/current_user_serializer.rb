# ==============================================================================
# app - serializers - current user serialzer
# ==============================================================================
class CurrentUserSerializer < ApplicationSerializer
  set_type :user
  attributes :firebase_uid
end
