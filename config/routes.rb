Rails.application.routes.draw do
  get 'home/index'
  get 'inventories/index'
  get 'inventories/show'
  get 'inventories/create'
  get 'items/new'
  get 'items/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
