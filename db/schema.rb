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

ActiveRecord::Schema.define(version: 2015_09_04_072043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", id: :serial, force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", id: :serial, force: :cascade do |t|
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
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "games", id: :serial, force: :cascade do |t|
    t.integer "visitor_id"
    t.integer "home_id"
    t.integer "visitor_rot"
    t.integer "home_rot"
    t.boolean "neutral", default: false
    t.integer "visitor_score"
    t.integer "home_score"
    t.float "closing_spread"
    t.date "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "data"
  end

  create_table "historicals", id: :serial, force: :cascade do |t|
    t.integer "year"
    t.string "home_team"
    t.string "away_team"
    t.float "spread"
    t.float "total"
    t.integer "h1q"
    t.integer "h2q"
    t.integer "h3q"
    t.integer "h4q"
    t.integer "hot"
    t.integer "hscore"
    t.integer "a1q"
    t.integer "a2q"
    t.integer "a3q"
    t.integer "a4q"
    t.integer "aot"
    t.integer "ascore"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "offense"
    t.string "defense"
    t.text "notes"
    t.integer "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float "hfa"
    t.float "power_ranking"
  end

  create_table "spreads", id: :serial, force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
    t.float "proj_spread"
    t.float "proj_total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float "home_win_percentage"
  end

  create_table "teams", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "conference"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "alias"
    t.string "sbr_alias"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
