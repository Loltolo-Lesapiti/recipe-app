require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  recipe = Recipe.new(name: 'Pilau', preparation_time: 2, cooking_time: 1, description: 'Pour water and some rice', public: true)
  food = Food.new(name: 'Pilau', measurement_unit: 'grams', price: 20)

  subject { RecipeFood.new(quantity: 2, food_id: food.id, recipee_id: recipe.id) }
  before { subject.save }

  it 'quantity should be present' do
    subject.quantity = nil
    expect(subject).to_not be_valid
  end

  it 'quantity should be integer' do
    subject.quantity = 'a'
    expect(subject).to_not be_valid
  end

  it 'food_id should be integer' do
    subject.food_id = nil
    expect(subject).to_not be_valid
  end

  it 'recipee_id should be integer' do
    subject.recipee_id = nil
    expect(subject).to_not be_valid
  end
end