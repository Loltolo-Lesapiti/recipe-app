Rails.application.routes.draw do
  root 'foods#index'
  resources :recipes
  resources :foods
  get 'recipe/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
