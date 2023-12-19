Rails.application.routes.draw do
  # get 'pages/hello'	  # get 'pages/hello'
  root 'pages#hello'	  # root 'pages#hello'
  root 'users#index'
  resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show]
end
