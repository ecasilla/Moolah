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

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 563d3f5f648ad73a06a465fe473ab7aa1197d254
ActiveRecord::Schema.define(version: 20131111211902) do
=======
ActiveRecord::Schema.define(version: 20131111213847) do
>>>>>>> master
<<<<<<< HEAD
=======
ActiveRecord::Schema.define(version: 20131111213847) do
>>>>>>> master
=======
>>>>>>> 563d3f5f648ad73a06a465fe473ab7aa1197d254

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.date     "date"
    t.string   "goal_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "connections", force: true do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  create_table "goals", force: true do |t|
    t.string   "name",         null: false
    t.text     "description"
    t.integer  "final_amount", null: false
    t.date     "deadline"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goals_users", force: true do |t|
    t.integer "goal_id"
    t.integer "user_id"
  end

  create_table "transactions", force: true do |t|
    t.integer  "user_id"
    t.integer  "goal_id"
    t.string   "description", null: false
    t.integer  "amount",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name",       null: false
    t.string   "last_name",        null: false
    t.string   "email",            null: false
    t.text     "photo_url"
    t.integer  "total_savings"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
