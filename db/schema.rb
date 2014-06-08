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

ActiveRecord::Schema.define(version: 20140608134912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.integer  "local_id",     null: false
    t.integer  "visitor_id",   null: false
    t.integer  "group_id"
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
    t.integer  "group_id",                  null: false
    t.integer  "points",        default: 0
    t.integer  "goals_for",     default: 0
    t.integer  "goals_against", default: 0
    t.integer  "difference",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
