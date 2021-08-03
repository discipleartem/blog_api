# frozen_string_literal: true

module Api
  module V1
    class RegistrationsController < BaseController
      def create
        user = User.new(registration_params)
        render json: user, serializer: Api::V1::UserSerializer, status: :created if user.save!
      end

      private

      def registration_params
        params.require(:registration).permit(:email, :password)
      end
    end
  end
end
