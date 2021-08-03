# frozen_string_literal: true

module Api
  module V1
    class CommentsController < BaseController
      before_action :current_user!, only: %i[create destroy]

      def create
        comment = find_article.comments.new comment_params.merge!(user_id: current_user!.id)
        render json: comment, serializer: Api::V1::CommentSerializer if comment.save!
      end

      def index
        comments = Comment.where(article_id: params[:article_id]).limit(100)
        render json: comments, each_serializer: Api::V1::CommentSerializer
      end

      def show
        comment = Comment.find params[:id]
        render json: comment, serializer: Api::V1::CommentSerializer
      end

      def destroy
        comment = Comment.find_by(id: params[:id], user_id: current_user!.id)
        if comment.present?
          comment.destroy
          message = { json: { access_token: nil, message: 'successful destroy current comment' } }
        else
          message = { status: 403 }
        end
        render message
      end

      private

      def comment_params
        params.require(:comment).permit(:body)
      end

      def find_article
        @find_article ||= Article.find params[:article_id]
      end
    end
  end
end
