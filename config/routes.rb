# frozen_string_literal: true

Rails.application.routes.draw do
  resources :interrogations
  resources :tags
  resources :prompts
  resources :notes
  resources :decks
  # For details on the DSL available within this file,
  # see https://guides.rubyonrails.org/routing.html

  scope :api, defaults: { format: :json } do
    root to: 'application#lander'
    post 'login', to: 'tokens#create'

    # resources :studies, only: [:index, :show]
    # resources :study_searches, only: [:create] do
    #   post 'autocomplete', on: :collection
    # end
  end

  # resources :users
end
