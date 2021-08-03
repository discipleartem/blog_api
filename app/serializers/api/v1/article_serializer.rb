# frozen_string_literal: true

module Api
  module V1
    class ArticleSerializer < ActiveModel::Serializer
      attributes :id, :title, :body, :category, :author, :created_at

      def body
        if instance_options[:action] == :index
          object.body.truncate(500)
        else
          object.body
        end
      end

      def author
        object.user.email.split('@')[0]
      end

      def created_at
        object.created_at.strftime('%m-%d-%Y')
      end
    end
  end
end
