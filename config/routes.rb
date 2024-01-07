Rails.application.routes.draw do
  resources :menus
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root 'menus#index'

  delete 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy', as: :logout_get

end
