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

ActiveRecord::Schema.define(version: 2020_05_03_095237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "novel_node_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["novel_node_id"], name: "index_favorites_on_novel_node_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "novel_nodes", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id"
    t.bigint "theme_id"
    t.boolean "is_temp"
    t.bigint "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "gen"
    t.index ["parent_id"], name: "index_novel_nodes_on_parent_id"
    t.index ["theme_id"], name: "index_novel_nodes_on_theme_id"
    t.index ["user_id"], name: "index_novel_nodes_on_user_id"
  end

  create_table "themes", force: :cascade do |t|
    t.bigint "who_id", null: false
    t.bigint "where_id", null: false
    t.bigint "what_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["what_id"], name: "index_themes_on_what_id"
    t.index ["where_id"], name: "index_themes_on_where_id"
    t.index ["who_id"], name: "index_themes_on_who_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "id_name"
    t.string "email"
    t.text "bio"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "whats", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_whats_on_user_id"
  end

  create_table "wheres", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_wheres_on_user_id"
  end

  create_table "whos", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_whos_on_user_id"
  end

  add_foreign_key "favorites", "novel_nodes"
  add_foreign_key "favorites", "users"
  add_foreign_key "novel_nodes", "novel_nodes", column: "parent_id"
  add_foreign_key "novel_nodes", "themes"
  add_foreign_key "novel_nodes", "users"
  add_foreign_key "themes", "whats"
  add_foreign_key "themes", "wheres"
  add_foreign_key "themes", "whos"
  add_foreign_key "whats", "users"
  add_foreign_key "wheres", "users"
  add_foreign_key "whos", "users"
end
