class UpdateProductTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :bogo, :boolean
    add_column :products, :is_bogo, :boolean, default: false
  end
end
