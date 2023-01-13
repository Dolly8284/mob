Rails.application.routes.draw do
  # get 'page/home'
  # get 'page/about'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :posts do
    resources :comments, only: [:create, :update, :destroy]
    get'latetscomment', on: :collection
    get 'like', on: :collection
  end
  get 'about', to: 'pages#about'
  
  devise_for :users
  
   root to: "home#index"
end

