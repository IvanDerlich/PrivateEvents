Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'events#index'

  # User
  resources :users, only: [:new, :create, :show]

  # Sessions
  get    '/login',   to: 'sessions#new'
  delete '/logout',  to: 'sessions#destroy'
  resources :sessions, only: [:create, :destroy]

  # Events
  resources :events, only: [:new, :create, :index]
end
