require 'rails_helper'

RSpec.describe 'Recipe Index', type: :system do
  before(:each) do
    @user = User.create(name: 'Petro', email: 'petro@gmail.com', password: 'Petro123',
                        password_confirmation: 'Petro123')
    @recipe = Recipe.create(user_id: @user.id, name: 'Pilau', preparation_time: '2hours', cooking_time: '3hours',
                            description: 'Add water and rice and let boil')
  end

  it 'User should log in' do
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  it 'User should log in' do
    visit root_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
    assert_text 'Recipe App'
    click_on 'Recipe List'
    click_link('New recipe')
    fill_in 'Name', with: @recipe.name
    fill_in 'Preparation time', with: @recipe.preparation_time
    fill_in 'Cooking time', with: @recipe.cooking_time
    fill_in 'Description', with: @recipe.description

    click_button 'Create Recipe'
  end
end
