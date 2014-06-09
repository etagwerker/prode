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

ActiveRecord::Schema.define(version: 20140609021203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "forecasts", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "home_goals"
    t.integer  "away_goals"
    t.integer  "winner_id"
    t.integer  "tournament_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "games", force: true do |t|
    t.integer  "local_id",                 null: false
    t.integer  "visitor_id",               null: false
    t.integer  "group_id"
    t.integer  "home_goals",   default: 0
    t.integer  "away_goals",   default: 0
    t.integer  "winner_id"
    t.datetime "time"
    t.integer  "order_number"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name",                      null: false
    t.string   "slug"
    t.integer  "group_id",                  null: false
    t.integer  "points",        default: 0
    t.integer  "goals_for",     default: 0
    t.integer  "goals_against", default: 0
    t.integer  "difference",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournaments", force: true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournaments_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "tournament_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "omniauth_provider"
    t.text     "omniauth_hash"
    t.string   "omniauth_uid"
    t.string   "profile_image_url"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["omniauth_provider", "omniauth_uid"], name: "index_users_on_omniauth_provider_and_omniauth_uid", unique: true, using: :btree

end
