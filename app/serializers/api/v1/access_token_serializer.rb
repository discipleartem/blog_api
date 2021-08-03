# frozen_string_literal: true

module Api
  module V1
    class AccessTokenSerializer < ActiveModel::Serializer
      attributes :token
    end
  end
end
