Rails.application.routes.draw do

  get 'shopping_list/index'
  resources :recipe_foods
  devise_for :users
  root 'foods#index'
  resources :recipes
  resources :foods
  get 'recipe/index'
  # get 'users/sign_up', to: redirect('users/sign_in')
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
end
