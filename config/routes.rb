Rails.application.routes.draw do
  root 'users#index'
  resources :users, except: [:edit, :update]
  resources :posts, except: [:edit, :update]
  resources :comments, only: [:create, :destroy]
end
