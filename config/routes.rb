Rails.application.routes.draw do
  root 'menus#index'

  resources :users do
    resources :menus
  end
  
  resources :menus do
    member do
      delete :favorite, to: 'favorites#destroy'
      post :favorite, to: 'favorites#create'
    end
  end

  namespace :mypage do
    resources :tree, only: [:index]
  end

  resources :sessions, only: [:new, :create, :destroy]

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
end
