# frozen_string_literal: true

module Api
  module V1
    module ArticleSearchConcern
      extend ActiveSupport::Concern

      # included do
      # end

      private

      def search_articles
        articles =
          if params[:author].present?
            search_article_by_author
          elsif params[:category].present?
            search_article_by_category
          end
        render json: articles, each_serializer: Api::V1::ArticleSerializer, action: :index
      end

      def author
        @author ||= User.find_by('email LIKE ?', "%#{params[:author]}%")
      end

      def search_article_by_author
        @search_article_by_author ||= Article.where(user_id: author.id).limit(100).order(created_at: :desc)
      end

      def search_article_by_category
        @search_article_by_category ||= Article.where(category: params[:category]).limit(100).order(created_at: :desc)
      end
    end
  end
end
