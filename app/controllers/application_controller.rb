class ApplicationController < ActionController::API
  include ActionController::MimeResponds

  def authenticate_request
    token = request.headers['Authorization'] ? request.headers['Authorization'].split(' ').last : nil
    @current_user = AuthToken.verify(token)

    unless @current_user
      render json: { error: 'Not Authorized' }, status: 401
    else
      render json: { error: 'Authorized'}, status: 'ok'
    end
  end
end
