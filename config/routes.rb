Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # User
  resources :users, only: [:new, :create, :show]

  # Sessions
  get    '/login',   to: 'sessions#new'
  resources :sessions, only: [:create, :destroy]
end
