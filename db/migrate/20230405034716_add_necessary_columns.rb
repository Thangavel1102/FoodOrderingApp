class AddNecessaryColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :tax_percent, :float
    add_column :products, :free_product_id, :integer
    add_column :products, :bogo, :boolean

    add_column :order_items, :tax_percent, :float
    add_column :order_items, :tax_price, :float
    add_column :order_items, :free_product_id, :integer
    add_column :order_items, :free_product_name, :string
    add_column :order_items, :discount_percent, :float
    add_column :order_items, :discount_price, :float
    add_column :order_items, :bogo, :boolean, default: false

    add_column :orders, :total_tax, :float
    add_column :orders, :discount_percent, :float
    add_column :orders, :discount_price, :float
    add_column :orders, :delivery_charge, :float
    add_column :orders, :total_discount_price, :float
    add_column :orders, :delivery_charge_applicable, :boolean, default: true
  end
end
