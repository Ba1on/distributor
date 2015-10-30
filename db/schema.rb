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

ActiveRecord::Schema.define(version: 20151030133830) do

  create_table "clients", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "redmine_id", limit: 4
  end

  create_table "issues", force: :cascade do |t|
    t.float    "estimated_hours", limit: 24
    t.float    "hours",           limit: 24
    t.string   "status",          limit: 255
    t.string   "subject",         limit: 255
    t.integer  "sprint_id",       limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "client_id",       limit: 4
  end

  create_table "sprint_clients", force: :cascade do |t|
    t.integer  "client_id",  limit: 4
    t.integer  "sprint_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "sprint_clients", ["client_id"], name: "index_sprint_clients_on_client_id", using: :btree
  add_index "sprint_clients", ["sprint_id"], name: "index_sprint_clients_on_sprint_id", using: :btree

  create_table "sprint_users", force: :cascade do |t|
    t.integer  "sprint_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "sprints", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "state",      limit: 1,   default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "work_hours", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
