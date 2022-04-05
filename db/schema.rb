

ActiveRecord::Schema.define(version: 2022_04_05_203730) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.index ["project_id"], name: "index_items_on_project_id"
  end

  create_table "items_manufacturers", id: false, force: :cascade do |t|
    t.bigint "manufacturer_id", null: false
    t.bigint "item_id", null: false
  end

  create_table "manufacturer_items", force: :cascade do |t|
    t.bigint "item_id"
    t.bigint "manufacturer_id"
    t.index ["item_id"], name: "index_manufacturer_items_on_item_id"
    t.index ["manufacturer_id"], name: "index_manufacturer_items_on_manufacturer_id"
  end

  create_table "manufacturers", force: :cascade do |t|
    t.string "name"
    t.string "location"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "manager"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "projects"
  add_foreign_key "manufacturer_items", "items"
  add_foreign_key "manufacturer_items", "manufacturers"
end
