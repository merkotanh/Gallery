Rails.application.routes.draw do
  
  devise_for :users

  get "upload" => "images#new", :as => "upload"

  get 'comments/show'
  get 'comments/create'
  get 'comments/edit'
  get 'comments/destroy'
  get 'images/index'
  get 'images/show'

  get 'images/new'
  get 'images/create'
  get 'images/update'
  get 'images/destroy'
  get 'images/show'
  get 'images/index'

  get 'categories/new'
  get 'categories/create'
  get 'categories/edit'
  get 'categories/update'
  get 'categories/destroy'
  get 'categories/show'

  resources :images, :categories
  
  resources :images do
    member do
      put 'like', to: "images#vote"
    end
  end
  
  resources :users do
    resources :categories
  end
 
  resources :users 
  resources :images do
    resources :comments
  end

  root to: "images#index" # здесь надо изменить на images#index
end
