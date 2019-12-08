# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_08_194747) do

  create_table "customers", force: :cascade do |t|
    t.integer "order_id", null: false
    t.string "external_code", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "phone_area_code"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.string "external_code", null: false
    t.string "name"
    t.decimal "price", precision: 10, scale: 2
    t.integer "quantity"
    t.decimal "total", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "logs", force: :cascade do |t|
    t.integer "order_id"
    t.string "status"
    t.string "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "external_code", null: false
    t.string "store_id", null: false
    t.decimal "sub_total", precision: 10, scale: 2
    t.decimal "delivery_fee", precision: 10, scale: 2
    t.decimal "total", precision: 10, scale: 2
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "district"
    t.string "street"
    t.string "complement"
    t.decimal "latitude", precision: 5, scale: 6
    t.decimal "longitude", precision: 5, scale: 6
    t.datetime "dt_order_create"
    t.string "postal_code"
    t.string "number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "order_id", null: false
    t.string "type"
    t.decimal "value", precision: 10, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
