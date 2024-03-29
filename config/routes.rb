Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  get 'pages/index'

  get 'comments/new'

  get 'g/:slug', to: 'gists#show', as: :short
  get 'tags/index'
  get 'tags/show'

  devise_for :users, controllers: { 
  	sessions: 'users/sessions',
    registrations: 'users/registrations',
  	confirmations: 'users/confirmations'
  }
  resources :users
  resources :gists do 
    collection do 
      get :explore
      get :search
    end
  end
  resources :notifications do 
    member do 
      get :link
      get :make_as_read
    end
  end
  resources :bookmarks, only: [:index, :create, :destroy]
  resources :tags, only: [:index, :show]
  resources :comments, only: [:create]
  resources :contacts, only: [:new, :create]
  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
