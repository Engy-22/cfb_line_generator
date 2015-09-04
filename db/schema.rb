# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150904072043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body"
    t.string   "resource_id",   limit: 255, null: false
    t.string   "resource_type", limit: 255, null: false
    t.integer  "author_id"
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "games", force: :cascade do |t|
    t.integer  "visitor_id"
    t.integer  "home_id"
    t.integer  "visitor_rot"
    t.integer  "home_rot"
    t.boolean  "neutral",        default: false
    t.integer  "visitor_score"
    t.integer  "home_score"
    t.float    "closing_spread"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data"
  end

  create_table "historicals", force: :cascade do |t|
    t.integer  "year"
    t.string   "home_team",  limit: 255
    t.string   "away_team",  limit: 255
    t.float    "spread"
    t.float    "total"
    t.integer  "h1q"
    t.integer  "h2q"
    t.integer  "h3q"
    t.integer  "h4q"
    t.integer  "hot"
    t.integer  "hscore"
    t.integer  "a1q"
    t.integer  "a2q"
    t.integer  "a3q"
    t.integer  "a4q"
    t.integer  "aot"
    t.integer  "ascore"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "offense",       limit: 255
    t.string   "defense",       limit: 255
    t.text     "notes"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "hfa"
    t.float    "power_ranking"
  end

  create_table "spreads", force: :cascade do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.float    "proj_spread"
    t.float    "proj_total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "home_win_percentage"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "conference", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "alias"
    t.string   "sbr_alias"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
