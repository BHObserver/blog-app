Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    root 'devise/sessions#new'
  end
  get '/user_sign_out', to: 'users#user_sign_out'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:new, :create]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
