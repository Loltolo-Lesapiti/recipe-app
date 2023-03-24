class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods, dependent: :destroy

  scope :public_recipes, -> { where(public: true).order(created_at: :desc) }

  def toggle_privacy!
    update(public: !public)
  end

  def toggle_shopping_tag!
    update(shopping_tag: !shopping_tag)
  end
end
