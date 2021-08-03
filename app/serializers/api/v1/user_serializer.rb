# frozen_string_literal: true

module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      attributes :id, :email, :token

      def token
        object.access_token.token
      end
    end
  end
end
