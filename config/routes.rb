Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    root 'devise/sessions#new'
  end

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end

  get '/user_sign_out', to: 'users#user_sign_out', as: :user_sign_out


  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:new, :create]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

end
