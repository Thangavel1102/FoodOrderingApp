class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :desc
      t.string :phone
      t.integer :location_id

      t.timestamps
    end
  end
end
