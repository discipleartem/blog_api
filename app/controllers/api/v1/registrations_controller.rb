# frozen_string_literal: true

module Api
  module V1
    class RegistrationsController < BaseController
      def create
        @current_user = User.new(registration_params)
        @current_user.save! && render(json: @current_user, serializer: Api::V1::UserSerializer, status: :created)
      end

      private

      def registration_params
        params.require(:registration).permit(:email, :password)
      end
    end
  end
end
