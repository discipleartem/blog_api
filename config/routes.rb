# frozen_string_literal: true

Rails.application.routes.draw do
  def render404
    Utils::Error.render_not_found
  end

  root to: ->(_env) { render404 }, via: :all

  namespace :api, defaults: { format: :json }, as: nil do
    namespace :v1, as: nil do
      resource :session, only: [], path: '' do
        post :create, path: :sign_in
        delete :destroy, path: :sign_out
      end

      resource :registration, only: [], path: '' do
        post :create, path: :sign_up
      end

      get '/articles/search', to: 'articles#search'
      resources :articles, only: %i[index create show destroy] do
        resources :comments, only: %i[index create show destroy]
      end
    end
  end
end
