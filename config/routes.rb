Rails.application.routes.draw do
  resources :order_items
  resources :orders
  resources :products
  resources :categories
  resources :restaurants
  resources :locations
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
