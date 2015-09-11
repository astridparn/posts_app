class ApplicationController < ActionController::API
  include ActionController::RespondWith

  include DeviseTokenAuth::Concerns::SetUserByToken

  Thread.new do
    loop do
      sleep(30*60)
      logger.fatal("ActiveRecord::Base.verify_active_connections!")
      ActiveRecord::Base.verify_active_connections!
      ActiveRecord::Base.connection.select_value('select 1')
    end
  end

end
