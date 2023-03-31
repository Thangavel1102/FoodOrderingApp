class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :desc
      t.integer :no_of_items
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
