class AuthenticationController < ApplicationController
  def signin
    user = User.find_by email: params[:email]
    jwt = user.authenticate(params[:password]) ? AuthToken.token(user) : nil
    render json: { jwt: jwt }
  end
end