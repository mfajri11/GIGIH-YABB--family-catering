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

ActiveRecord::Schema.define(version: 2022_04_21_105509) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "phoneNumber"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "menu_categories", force: :cascade do |t|
    t.integer "menu_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_menu_categories_on_category_id"
    t.index ["menu_id"], name: "index_menu_categories_on_menu_id"
  end

  create_table "menu_orders", force: :cascade do |t|
    t.integer "menu_id", null: false
    t.integer "order_id", null: false
    t.integer "qty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["menu_id"], name: "index_menu_orders_on_menu_id"
    t.index ["order_id"], name: "index_menu_orders_on_order_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "customer_id"
    t.float "total"
    t.datetime "order_date", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
  end

  add_foreign_key "menu_categories", "categories"
  add_foreign_key "menu_categories", "menus"
  add_foreign_key "menu_orders", "menus"
  add_foreign_key "menu_orders", "orders"
end
