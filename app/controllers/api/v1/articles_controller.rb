# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < BaseController
      before_action :current_user!, only: %i[create destroy]
      before_action :check_search_params, only: :search

      include Api::V1::ArticleSearchConcern

      def index
        articles = Article.limit(100).order(created_at: :desc)
        render json: articles, each_serializer: Api::V1::ArticleSerializer, action: :index
      end

      def show
        article = Article.find params[:id]
        render json: article, serializer: Api::V1::ArticleSerializer, action: :show
      end

      def create
        article = Article.transaction do
          current_user!.articles.create! article_params
        rescue ActiveRecord::Rollback
          raise ActiveRecord::RecordInvalid
        end
        render json: article.persisted? && article, serializer: Api::V1::ArticleSerializer, action: :create
      end

      def search
        search_articles
      end

      def destroy
        article = Article.find_by(id: params[:id], user_id: current_user!.id)
        if article.present?
          article.destroy
          message = { json: { access_token: nil, message: 'successful destroy current article' } }
        else
          message = { status: 403 }
        end
        render message
      end

      private

      def article_params
        params.require(:article).permit(:title, :body, :category)
      end

      def check_search_params
        raise ArgumentError, 'wrong number of arguments (given 2, expected 1)' if params[:author] && params[:category]
      end
    end
  end
end
