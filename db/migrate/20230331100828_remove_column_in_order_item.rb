class RemoveColumnInOrderItem < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_items, :unit_price, :float
    add_column :order_items, :price, :float
  end
end
