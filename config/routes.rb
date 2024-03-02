Rails.application.routes.draw do
  root 'menus#index'

  resources :menus do
    resources :favorites, only: [:create, :destroy]
  end

  #resources :users  do
    #get :favorites, on: :collection
  #end

  resources :users
    resources :menus do
      collection do 
        get :favorites 
      end
    end
    resources :favorites, only: %i[create destroy]

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

  devise_for :users

end
