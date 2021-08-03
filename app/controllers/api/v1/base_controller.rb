# frozen_string_literal: true

module Api
  module V1
    class BaseController < ApplicationController
      PATTERN = 'Token '
      # attr_reader :current_user

      private

      def current_user!
        return @current_user if defined?(@current_user)

        authorization_header = request.headers['Authorization'].to_s.gsub(PATTERN, '')
        @current_user = AccessToken.find_by!(token: authorization_header)&.user
      end
    end
  end
end
