Rails.application.routes.draw do
  root 'top#index'
  resources :teams do
    resources :buy_items, only: :index
    resources :researches, only: :index
    resources :items, only: :index
  end
  resources :users do
    resources :take_inventories
  end
end
