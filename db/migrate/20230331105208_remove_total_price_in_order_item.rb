class RemoveTotalPriceInOrderItem < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_items, :total_price, :float
  end
end
