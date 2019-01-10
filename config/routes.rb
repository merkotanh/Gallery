Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :admin_users, ActiveAdmin::Devise.config

  match "/admin/ng" => 'admin/ng', via: :post

  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    
    devise_for :users, skip: :omniauth_callbacks#, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

    resources :images, :categories
    resources :users, only: [:show, :edit, :update]
  
    resources :images do
      member do
        put 'like', to: "images#vote"
      end
    end
  
    resources :users do
      resources :categories
    end

    resources :friendships, only: [:create, :destroy, :delete]
 
    resources :users
    resources :images do
      resources :comments
    end

    get "upload" => "images#new", :as => "upload"
    root to: "categories#index"
  end
end
