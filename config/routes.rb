# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    root to: 'application#lander'
    post 'login', to: 'tokens#create'

    resources :interrogations
    resources :tags
    resources :notes do
      get 'overview', on: :collection
      post 'review', on: :collection
    end
    resources :decks
    # resources :users
  end
end
