# frozen_string_literal: true

module Api
  module V1
    class CommentSerializer < ActiveModel::Serializer
      attributes :id, :body, :author, :created_at

      def author
        object.user.email.split('@')[0]
      end

      def created_at
        object.created_at.strftime('%m-%d-%Y')
      end
    end
  end
end
