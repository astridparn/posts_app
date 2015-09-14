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

  Thread.new do
    loop do
      sleep(30*60)
      logger.fatal("ActiveRecord::Base.verify_active_connections!")
      ActiveRecord::Base.verify_active_connections!
      ActiveRecord::Base.connection.select_value('select 1')
    end
  end

end
