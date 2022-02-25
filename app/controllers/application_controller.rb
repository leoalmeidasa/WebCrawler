class ApplicationController < ActionController::API
  before_action :auth_user

  private

  def token_request
    return nil if request.headers['Authorization'].nil?

    request.headers['Authorization'].split(' ')[1]
  end

  def auth_user
    user_id = AuthTokenService.decode(token_request)
    @current_user = User.find(user_id['user_id'])
    @current_user
  end
end
