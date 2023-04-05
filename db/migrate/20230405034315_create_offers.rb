class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :offer_type
      t.integer :qty
      t.float :amount
      t.boolean :is_bogo
      t.float :discount_percent

      t.timestamps
    end
  end
end
