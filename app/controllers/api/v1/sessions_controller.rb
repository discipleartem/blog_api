# frozen_string_literal: true

module Api
  module V1
    class SessionsController < BaseController
      before_action :current_user!, only: :destroy

      def create
        user = User.find_by(email: session_params[:email])&.authenticate(session_params[:password])
        raise StandardError, 'Wrong email or password' if user.blank?

        user.access_tokens.create(token: GenerateTokenService.call)
        render json: user, serializer: Api::V1::UserSerializer, status: :accepted if user
      end

      def destroy
        current_user!.access_token.destroy
        render json: { access_token: nil, message: 'successful sign out' }, status: :accepted
      end

      private

      def session_params
        params.require(:session).permit(:email, :password)
      end
    end
  end
end
