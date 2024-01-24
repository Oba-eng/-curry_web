Rails.application.routes.draw do
  resources :menus
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root 'menus#index'

  delete 'logout', to: 'sessions#destroy'
  get 'logout', to: 'sessions#destroy', as: :logout_get

  # フッターのリンクを作成
  get 'privacy', to: 'pages#privacy', as: :privacy
  get 'terms', to: 'pages#terms', as: :terms

  # お問い合わせメール
  namespace :public do
    resources :contacts, only: [:new, :create] do
      collection do
        post 'confirm'
        post 'back'
        get 'done'
      end
    end
  end

  devise_for :users

end
