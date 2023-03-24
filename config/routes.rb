Rails.application.routes.draw do
  devise_for :users
  resources :foods
  resources :recipes do
    resources :recipe_foods, only: [:create,:destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "foods#index"

     # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "/public_recipes", to: "public_recipes#index"

  get '/shopping_list/:id', to: 'shopping_list#index', as: 'shopping_list'
  put '/recipes/:id/toggle_privacy', to: 'recipes#toggle_privacy', as: 'toggle_recipe_privacy'
  put '/recipes/:id/toggle_shopping_tag', to: 'recipes#toggle_shopping_tag', as: 'toggle_shopping_tag'
  patch 'shopping_lists/toggle_shopping_tag', to: 'shopping_lists#toggle_shopping_tag', as: 'toggle_shopping_tag_all'
  
end
