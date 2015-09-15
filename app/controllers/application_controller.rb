class ApplicationController < ActionController::API
  include ActionController::RespondWith
  include DeviseTokenAuth::Concerns::SetUserByToken
  include Pundit

  # Globally rescue Authorization Errors in controller.
  # Returning 403 Forbidden if permission is denied
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  def permission_denied
    head 403
  end

end
