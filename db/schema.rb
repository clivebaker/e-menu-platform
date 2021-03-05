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

ActiveRecord::Schema.define(version: 2021_03_03_165415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "baskets", force: :cascade do |t|
    t.jsonb "contents", default: {}
    t.string "key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "discount_code"
  end

  create_table "cook_levels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cook_levels_menus", id: false, force: :cascade do |t|
    t.bigint "menu_id", null: false
    t.bigint "cook_level_id", null: false
  end

  create_table "cuisines", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.string "flag"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "symbol"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "custom_list_items", force: :cascade do |t|
    t.string "name"
    t.bigint "custom_list_id"
    t.decimal "price"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cloned_from"
    t.boolean "available", default: true
    t.index ["custom_list_id"], name: "index_custom_list_items_on_custom_list_id"
  end

  create_table "custom_lists", force: :cascade do |t|
    t.string "name"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "constraint"
    t.integer "position"
    t.integer "cloned_from"
    t.boolean "required_items", default: false
    t.integer "limit_min"
    t.integer "limit_count"
    t.integer "limit_max"
    t.index ["restaurant_id"], name: "index_custom_lists_on_restaurant_id"
  end

  create_table "daily_reportings", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.jsonb "data"
    t.date "date"
    t.integer "total"
    t.integer "items_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_daily_reportings_on_restaurant_id"
  end

  create_table "delivery_postcodes", force: :cascade do |t|
    t.string "prefix"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "delivery_fee", precision: 5, scale: 2
    t.index ["restaurant_id"], name: "index_delivery_postcodes_on_restaurant_id"
  end

  create_table "discount_codes", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.float "amount"
    t.string "type"
    t.string "code"
    t.integer "max_uses"
    t.integer "used_times", default: 0
    t.datetime "expires_on"
    t.boolean "single_use_per_user"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_discount_codes_on_restaurant_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features_packages", id: false, force: :cascade do |t|
    t.bigint "package_id", null: false
    t.bigint "feature_id", null: false
  end

  create_table "features_restaurants", id: false, force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.bigint "feature_id", null: false
  end

  create_table "item_screen_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "key"
  end

  create_table "item_screens", force: :cascade do |t|
    t.bigint "item_screen_type_id"
    t.bigint "restaurant_id"
    t.bigint "printer_id"
    t.boolean "on_new"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "buzz_on_new"
    t.boolean "grouped", default: true
    t.index ["item_screen_type_id"], name: "index_item_screens_on_item_screen_type_id"
    t.index ["printer_id"], name: "index_item_screens_on_printer_id"
    t.index ["restaurant_id"], name: "index_item_screens_on_restaurant_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "locale"
    t.string "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "language_code"
  end

  create_table "manager_settings", force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_item_categorisations", force: :cascade do |t|
    t.string "name"
    t.text "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type", default: "allergen"
  end

  create_table "menu_item_categorisations_menus", id: false, force: :cascade do |t|
    t.bigint "menu_id", null: false
    t.bigint "menu_item_categorisation_id", null: false
  end

  create_table "menu_translations", force: :cascade do |t|
    t.integer "menu_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.index ["locale"], name: "index_menu_translations_on_locale"
    t.index ["menu_id"], name: "index_menu_translations_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.bigint "spice_level_id"
    t.bigint "menu_item_categorisation_id"
    t.jsonb "prices", array: true
    t.boolean "available", default: true
    t.integer "calories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.string "node_type"
    t.decimal "price_a", precision: 6, scale: 2
    t.decimal "price_b", precision: 6, scale: 2
    t.text "nutrition"
    t.text "provenance"
    t.jsonb "custom_lists", default: {}
    t.integer "position"
    t.string "css_class"
    t.boolean "is_deleted", default: false
    t.integer "root_node_id"
    t.jsonb "old_custom_lists"
    t.bigint "item_screen_type_id"
    t.integer "secondary_item_screen_type_id"
    t.index ["ancestry"], name: "index_menus_on_ancestry"
    t.index ["item_screen_type_id"], name: "index_menus_on_item_screen_type_id"
    t.index ["menu_item_categorisation_id"], name: "index_menus_on_menu_item_categorisation_id"
    t.index ["restaurant_id"], name: "index_menus_on_restaurant_id"
    t.index ["spice_level_id"], name: "index_menus_on_spice_level_id"
  end

  create_table "onboards", force: :cascade do |t|
    t.bigint "restaurant_user_id", null: false
    t.boolean "tos_agreed"
    t.datetime "tos_agreed_date"
    t.string "tos_ver_agreed"
    t.string "tos_ip"
    t.text "tos_user_agent"
    t.boolean "free_trial"
    t.boolean "completed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_user_id"], name: "index_onboards_on_restaurant_user_id"
  end

  create_table "opening_times", force: :cascade do |t|
    t.bigint "restaurant_id"
    t.jsonb "times", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "delay_time_minutes", default: 30
    t.integer "kitchen_delay_minutes", default: 0
    t.index ["restaurant_id"], name: "index_opening_times_on_restaurant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "long_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "restaurant_id", null: false
    t.integer "value", default: 0
    t.string "currency"
    t.json "stripe_data"
    t.string "uuid"
    t.integer "basket_total", default: 0
    t.jsonb "items"
    t.string "stripe_token"
    t.string "status"
    t.boolean "is_ready"
    t.string "email"
    t.string "name"
    t.string "collection_time"
    t.string "telephone"
    t.string "address"
    t.string "delivery_or_collection"
    t.string "delivery_fee", default: "0"
    t.string "table_number"
    t.string "discount_code"
    t.integer "application_fee_amount", default: 0
    t.integer "emenu_commission", default: 0
    t.integer "chargeback_fee", default: 0
    t.boolean "chargeback_enabled", default: false
    t.integer "emenu_vat_charge", default: 0
    t.integer "stripe_processing_fee"
    t.index ["restaurant_id"], name: "index_orders_on_restaurant_id"
  end

  create_table "orders_patrons", id: false, force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "patron_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_orders_patrons_on_order_id"
    t.index ["patron_id"], name: "index_orders_patrons_on_patron_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patron_addresses", force: :cascade do |t|
    t.bigint "patron_id", null: false
    t.boolean "house_number"
    t.boolean "street"
    t.boolean "postcode"
    t.boolean "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patron_id"], name: "index_patron_addresses_on_patron_id"
  end

  create_table "patron_allergens", force: :cascade do |t|
    t.boolean "active"
    t.bigint "patron_id", null: false
    t.bigint "menu_item_categorisation_id", null: false
    t.index ["menu_item_categorisation_id"], name: "index_patron_allergens_on_menu_item_categorisation_id"
    t.index ["patron_id"], name: "index_patron_allergens_on_patron_id"
  end

  create_table "patron_baskets", force: :cascade do |t|
    t.bigint "patron_id", null: false
    t.bigint "basket_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["basket_id"], name: "index_patron_baskets_on_basket_id"
    t.index ["patron_id"], name: "index_patron_baskets_on_patron_id"
  end

  create_table "patron_marketing_preferences", force: :cascade do |t|
    t.bigint "patron_id", null: false
    t.boolean "emenu_news"
    t.boolean "emenu_promotions"
    t.boolean "restaurant_news"
    t.boolean "restaurant_promotions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["patron_id"], name: "index_patron_marketing_preferences_on_patron_id"
  end

  create_table "patron_orders", force: :cascade do |t|
    t.bigint "patron_id", null: false
    t.bigint "order_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_patron_orders_on_order_id"
    t.index ["patron_id"], name: "index_patron_orders_on_patron_id"
  end

  create_table "patrons", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "has_no_password", default: false
    t.string "full_name"
    t.string "phone"
    t.index ["email"], name: "index_patrons_on_email", unique: true
    t.index ["reset_password_token"], name: "index_patrons_on_reset_password_token", unique: true
  end

  create_table "pi_interfaces", force: :cascade do |t|
    t.string "server_token"
    t.bigint "restaurant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "online"
    t.text "lsusb"
    t.text "lsusb_compare"
    t.string "version"
    t.index ["restaurant_id"], name: "index_pi_interfaces_on_restaurant_id"
  end

  create_table "printers", force: :cascade do |t|
    t.string "name"
    t.bigint "pi_interface_id"
    t.string "vendor"
    t.string "product"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "print_type"
    t.bigint "restaurant_id"
    t.index ["pi_interface_id"], name: "index_printers_on_pi_interface_id"
    t.index ["restaurant_id"], name: "index_printers_on_restaurant_id"
  end

  create_table "raspberry_pi_statuses", force: :cascade do |t|
    t.boolean "state"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "raspberry_pi_updates", force: :cascade do |t|
    t.string "version"
    t.text "payload"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "receipts", force: :cascade do |t|
    t.string "uuid"
    t.bigint "restaurant_id"
    t.integer "basket_total", default: 0
    t.jsonb "items"
    t.string "email"
    t.string "stripe_token"
    t.string "status"
    t.boolean "is_ready"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "source"
    t.string "collection_time"
    t.string "telephone"
    t.string "address"
    t.string "delivery_or_collection"
    t.decimal "delivery_fee", precision: 8, scale: 2, default: "0.0"
    t.string "table_number"
    t.bigint "order_id"
    t.bigint "discount_code_id"
    t.integer "application_fee_amount", default: 0
    t.integer "emenu_commission", default: 0
    t.integer "chargeback_fee", default: 0
    t.boolean "chargeback_enabled", default: false
    t.integer "emenu_vat_charge", default: 0
    t.integer "stripe_processing_fee"
    t.index ["discount_code_id"], name: "index_receipts_on_discount_code_id"
    t.index ["order_id"], name: "index_receipts_on_order_id"
    t.index ["restaurant_id"], name: "index_receipts_on_restaurant_id"
  end

  create_table "refunds", force: :cascade do |t|
    t.bigint "order_id"
    t.jsonb "stripe_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_refunds_on_order_id"
  end

  create_table "restaurant_tables", force: :cascade do |t|
    t.integer "number"
    t.bigint "restaurant_id"
    t.string "code"
    t.string "aasm_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_seats"
    t.index ["restaurant_id"], name: "index_restaurant_tables_on_restaurant_id"
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
    t.text "roles", default: [], array: true
    t.boolean "admin", default: false
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
    t.string "slug"
    t.integer "active_menu_ids", default: [], array: true
    t.string "path"
    t.string "css_font_url"
    t.string "css_font_class"
    t.text "custom_css"
    t.text "custom_styles"
    t.string "url"
    t.string "stripe_api_key"
    t.string "stripe_publish_api_key"
    t.integer "delay_time_minutes"
    t.boolean "show_on_homepage"
    t.string "facebook_pixel"
    t.string "subtle_background"
    t.bigint "currency_id"
    t.string "stripe_connected_account_id"
    t.float "commision_percentage", default: 0.0
    t.boolean "stripe_chargeback_enabled", default: false
    t.boolean "subscription_enabled", default: true
    t.index ["cuisine_id"], name: "index_restaurants_on_cuisine_id"
    t.index ["currency_id"], name: "index_restaurants_on_currency_id"
    t.index ["restaurant_user_id"], name: "index_restaurants_on_restaurant_user_id"
  end

  create_table "restaurants_templates", id: false, force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.bigint "template_id", null: false
  end

  create_table "screen_items", force: :cascade do |t|
    t.bigint "menu_id"
    t.bigint "restaurant_id"
    t.boolean "ready", default: false
    t.bigint "receipt_id"
    t.string "item_screen_type_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.boolean "secondary", default: false
    t.index ["menu_id"], name: "index_screen_items_on_menu_id"
    t.index ["receipt_id"], name: "index_screen_items_on_receipt_id"
    t.index ["restaurant_id"], name: "index_screen_items_on_restaurant_id"
  end

  create_table "spice_levels", force: :cascade do |t|
    t.string "name"
    t.text "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "table_items", force: :cascade do |t|
    t.bigint "table_id"
    t.bigint "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "for"
    t.string "token"
    t.jsonb "custom_lists", default: {}
    t.string "aasm_state"
    t.index ["menu_id"], name: "index_table_items_on_menu_id"
    t.index ["table_id"], name: "index_table_items_on_table_id"
  end

  create_table "tables", force: :cascade do |t|
    t.bigint "restaurant_table_id"
    t.string "password"
    t.string "aasm_state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_table_id"], name: "index_tables_on_restaurant_table_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "name"
    t.string "key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "themes", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.string "color_primary"
    t.string "color_secondary"
    t.string "css_font_url"
    t.string "font_primary"
    t.integer "font_weight_primary"
    t.string "text_transform_primary"
    t.string "font_style_primary"
    t.string "font_secondary"
    t.integer "font_weight_secondary"
    t.string "text_transform_secondary"
    t.string "font_style_secondary"
    t.boolean "dark_theme"
    t.text "custom_css"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "basket_colour", default: "#000"
    t.string "item_colour", default: "#000"
    t.string "basket_text_colour", default: "#fff"
    t.string "item_text_colour", default: "#fff"
    t.string "item_header_colour", default: "#000"
    t.index ["restaurant_id"], name: "index_themes_on_restaurant_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "custom_list_items", "custom_lists"
  add_foreign_key "custom_lists", "restaurants"
  add_foreign_key "daily_reportings", "restaurants"
  add_foreign_key "delivery_postcodes", "restaurants"
  add_foreign_key "discount_codes", "restaurants"
  add_foreign_key "item_screens", "item_screen_types"
  add_foreign_key "item_screens", "printers"
  add_foreign_key "item_screens", "restaurants"
  add_foreign_key "menus", "item_screen_types"
  add_foreign_key "menus", "menu_item_categorisations"
  add_foreign_key "menus", "restaurants"
  add_foreign_key "menus", "spice_levels"
  add_foreign_key "onboards", "restaurant_users"
  add_foreign_key "opening_times", "restaurants"
  add_foreign_key "orders", "restaurants"
  add_foreign_key "patron_addresses", "patrons"
  add_foreign_key "patron_allergens", "patrons"
  add_foreign_key "patron_baskets", "baskets"
  add_foreign_key "patron_baskets", "patrons"
  add_foreign_key "patron_marketing_preferences", "patrons"
  add_foreign_key "patron_orders", "orders"
  add_foreign_key "patron_orders", "patrons"
  add_foreign_key "printers", "pi_interfaces"
  add_foreign_key "printers", "restaurants"
  add_foreign_key "receipts", "discount_codes"
  add_foreign_key "receipts", "orders"
  add_foreign_key "receipts", "restaurants"
  add_foreign_key "restaurant_tables", "restaurants"
  add_foreign_key "restaurants", "cuisines"
  add_foreign_key "restaurants", "currencies"
  add_foreign_key "restaurants", "restaurant_users"
  add_foreign_key "screen_items", "menus"
  add_foreign_key "screen_items", "receipts"
  add_foreign_key "screen_items", "restaurants"
  add_foreign_key "table_items", "menus"
  add_foreign_key "table_items", "tables"
  add_foreign_key "tables", "restaurant_tables"
  add_foreign_key "themes", "restaurants"
end
