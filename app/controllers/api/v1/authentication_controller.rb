module Api
  module V1
    class AuthenticationController < ApplicationController

      before_action :auth_user

      def create
        @user = User.find_by(login: user_params[:login])
        @token = AuthTokenService.encode(@user.id.to_s)

        render json: { token: @token }
      end

      private

      def user_params
        params.permit(:login, :password)
      end
    end
  end
end
