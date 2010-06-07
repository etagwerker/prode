# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100606172143) do

  create_table "forecasts", :force => true do |t|
    t.integer  "game_id"
    t.integer  "user_id"
    t.integer  "home_goals"
    t.integer  "away_goals"
    t.boolean  "collected",  :default => false
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "correct",    :default => false
    t.boolean  "exact",      :default => false
  end

  create_table "games", :force => true do |t|
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "home_goals"
    t.integer  "away_goals"
    t.integer  "number"
    t.datetime "datetime"
    t.string   "result"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "nick"
    t.boolean  "admin"
    t.integer  "score",      :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
