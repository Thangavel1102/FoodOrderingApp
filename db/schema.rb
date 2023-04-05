# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_05_110839) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.integer "no_of_items"
    t.integer "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string "offer_type"
    t.integer "qty"
    t.float "amount"
    t.boolean "is_bogo"
    t.float "discount_percent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id"
    t.integer "qty"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.float "tax_percent"
    t.float "tax_price"
    t.integer "free_product_id"
    t.string "free_product_name"
    t.float "discount_percent"
    t.float "discount_price"
    t.boolean "bogo", default: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "no_of_items"
    t.string "total"
    t.string "status"
    t.integer "location_id"
    t.integer "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "total_tax"
    t.float "discount_percent"
    t.float "discount_price"
    t.float "delivery_charge"
    t.float "total_discount_price"
    t.boolean "delivery_charge_applicable", default: true
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.float "unit_price"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "tax_percent"
    t.integer "free_product_id"
    t.boolean "is_bogo", default: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.string "phone"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
