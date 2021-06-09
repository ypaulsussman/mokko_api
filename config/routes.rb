# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    root to: 'application#lander'
    post 'login', to: 'tokens#create'

    resources :decks
    resources :prompts
    resources :mokkos
    resources :tags
    resources :notes do
      get 'review', on: :collection
    end
    # resources :users
  end
end
