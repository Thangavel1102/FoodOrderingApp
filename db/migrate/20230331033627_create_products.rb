class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :desc
      t.float :unit_price
      t.integer :category_id

      t.timestamps
    end
  end
end
