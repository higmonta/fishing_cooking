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

ActiveRecord::Schema.define(version: 2022_09_12_164651) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "cooking_informations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "cooking_id", null: false
    t.bigint "fish_id", null: false
    t.string "image"
    t.integer "cooking_time", null: false
    t.string "cooking_url"
    t.bigint "handle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rest_fish_time", null: false
    t.integer "cooking_total_time", null: false
    t.bigint "cookware_id"
    t.index ["cooking_id", "fish_id"], name: "index_cooking_informations_on_cooking_id_and_fish_id", unique: true
    t.index ["cooking_id"], name: "index_cooking_informations_on_cooking_id"
    t.index ["cookware_id"], name: "index_cooking_informations_on_cookware_id"
    t.index ["fish_id", "cooking_id", "handle_id"], name: "fish_id_cooking_id_handle_id_index", unique: true
    t.index ["fish_id"], name: "index_cooking_informations_on_fish_id"
    t.index ["handle_id"], name: "index_cooking_informations_on_handle_id"
  end

  create_table "cooking_memories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "cooking_name", null: false
    t.string "fish_name", null: false
    t.date "cooking_date"
    t.text "memo"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_cooking_memories_on_user_id"
  end

  create_table "cookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_cookings_on_name", unique: true
  end

  create_table "cookwares", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_cookwares_on_name", unique: true
  end

  create_table "fish_handle_informations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "fish_id", null: false
    t.bigint "handle_id", null: false
    t.integer "handle_time", null: false
    t.string "handle_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fish_id", "handle_id"], name: "fish_id_handle_id_index", unique: true
    t.index ["fish_id"], name: "index_fish_handle_informations_on_fish_id"
    t.index ["handle_id"], name: "index_fish_handle_informations_on_handle_id"
  end

  create_table "fishes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "kind", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kind"], name: "index_fishes_on_kind", unique: true
  end

  create_table "handles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "pattern", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pattern"], name: "index_handles_on_pattern", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.integer "role", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cooking_informations", "cookings"
  add_foreign_key "cooking_informations", "cookwares"
  add_foreign_key "cooking_informations", "fishes"
  add_foreign_key "cooking_informations", "handles"
  add_foreign_key "cooking_memories", "users"
  add_foreign_key "fish_handle_informations", "fishes"
  add_foreign_key "fish_handle_informations", "handles"
end
