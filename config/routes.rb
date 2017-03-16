Rails.application.routes.draw do
  get 'tags/index'

  get 'tags/show'

  devise_for :users, controllers: { 
  	sessions: 'users/sessions',
    registrations: 'users/registrations',
  	confirmations: 'users/confirmations'
  }
  resources :gists
  resources :tags, only: [:index, :show]
  root 'gists#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
