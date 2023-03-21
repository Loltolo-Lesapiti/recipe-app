class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.decimal :measurement_unit
      t.decimal :price
      t.float :quantity
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
