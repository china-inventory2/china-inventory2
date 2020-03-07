Rails.application.routes.draw do
  root 'top#index'
  post '/', to:'sessions#create'
  delete 'logout', to:"sessions#destroy"
  resources :teams do
    resources :buy_items, only: :index
    resources :researches, only: :index
    resources :items, only: :index
  end
  resources :users do
    resources :take_inventories
  end
  resources :images
end
