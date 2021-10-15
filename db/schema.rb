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

ActiveRecord::Schema.define(version: 2021_10_15_184543) do

  create_table "cooking_informations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "cooking_id", null: false
    t.bigint "fish_id", null: false
    t.string "image"
    t.time "cooking_time", null: false
    t.string "cooking_url"
    t.bigint "handle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cooking_id"], name: "index_cooking_informations_on_cooking_id"
    t.index ["fish_id"], name: "index_cooking_informations_on_fish_id"
    t.index ["handle_id"], name: "index_cooking_informations_on_handle_id"
  end

  create_table "cookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_cookings_on_name", unique: true
  end

  create_table "fish", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "kind", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kind"], name: "index_fish_on_kind", unique: true
  end

  create_table "fish_handle_informations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "fish_id", null: false
    t.bigint "handle_id", null: false
    t.time "handle_time", null: false
    t.string "handle_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fish_id"], name: "index_fish_handle_informations_on_fish_id"
    t.index ["handle_id"], name: "index_fish_handle_informations_on_handle_id"
  end

  create_table "handles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["type"], name: "index_handles_on_type", unique: true
  end

  add_foreign_key "cooking_informations", "cookings"
  add_foreign_key "cooking_informations", "fish"
  add_foreign_key "cooking_informations", "handles"
  add_foreign_key "fish_handle_informations", "fish"
  add_foreign_key "fish_handle_informations", "handles"
end
