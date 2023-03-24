class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:foods).where(public: true).order('created_at DESC')
  end
end  
