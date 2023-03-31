class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :qty
      t.float :unit_price
      t.float :total_price
      t.integer :product_id

      t.timestamps
    end
  end
end
