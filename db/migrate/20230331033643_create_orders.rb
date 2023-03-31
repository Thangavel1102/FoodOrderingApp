class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :no_of_items
      t.string :total
      t.string :status
      t.integer :location_id
      t.integer :restaurant_id

      t.timestamps
    end
  end
end
