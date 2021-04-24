# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    root to: 'application#lander'
    post 'login', to: 'tokens#create'

    resources :interrogations
    resources :tags
    resources :prompts
    resources :notes
    resources :decks
    # resources :users
  end
end
