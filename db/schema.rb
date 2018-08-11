# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_09_074145) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cuisines", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "flag"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_item_categorisations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.string "name"
    t.text "description"
    t.string "image"
    t.bigint "spice_level_id"
    t.bigint "menu_item_categorisation_id"
    t.jsonb "prices", array: true
    t.boolean "available"
    t.integer "calories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.string "node_type"
    t.index ["ancestry"], name: "index_menus_on_ancestry"
    t.index ["menu_item_categorisation_id"], name: "index_menus_on_menu_item_categorisation_id"
    t.index ["restaurant_id"], name: "index_menus_on_restaurant_id"
    t.index ["spice_level_id"], name: "index_menus_on_spice_level_id"
  end

  create_table "restaurant_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roles", array: true
    t.index ["email"], name: "index_restaurant_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_restaurant_users_on_reset_password_token", unique: true
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "postcode"
    t.string "telephone"
    t.string "email"
    t.string "twitter"
    t.string "facebook"
    t.jsonb "opening_times", default: {}
    t.boolean "is_chain"
    t.bigint "cuisine_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "restaurant_user_id"
    t.index ["cuisine_id"], name: "index_restaurants_on_cuisine_id"
    t.index ["restaurant_user_id"], name: "index_restaurants_on_restaurant_user_id"
  end

  create_table "spice_levels", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "menus", "menu_item_categorisations"
  add_foreign_key "menus", "restaurants"
  add_foreign_key "menus", "spice_levels"
  add_foreign_key "restaurants", "cuisines"
  add_foreign_key "restaurants", "restaurant_users"
end
