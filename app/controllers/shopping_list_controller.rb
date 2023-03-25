class ShoppingListController < ApplicationController
  def index
    @allfoods = RecipeFood.where(recipe_id: params[:id]).includes(:food)
    # @allfoods = Food.all
  end
end
