Rails.application.routes.draw do

  get 'images/index'
  get 'images/show'
  devise_for :users

  get "upload" => "images#new", :as => "upload"

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

  resources :users do
    resources :categories
  end

  root to: "images#index" # здесь надо изменить на images#index
end
