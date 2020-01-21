Rails.application.routes.draw do
  resources :take_inventories
  resources :buy_items
  resources :items
  resources :researches
  resources :teams
  resources :users
end
