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

ActiveRecord::Schema.define(version: 20160408210745) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calls", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "data"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "uuid",          default: "", null: false
    t.string   "voicemail_url"
  end

  add_index "calls", ["uuid"], name: "index_calls_on_uuid", unique: true, using: :btree

  create_table "company_numbers", force: :cascade do |t|
    t.string   "sip_endpoint"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "name",         default: "", null: false
  end

  create_table "group_memberships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "company_number_id"
  end

  add_index "group_memberships", ["user_id", "company_number_id"], name: "index_group_memberships_on_user_id_and_company_number_id", unique: true, using: :btree

  create_table "user_numbers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "sip_endpoint"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "user_numbers", ["user_id"], name: "index_user_numbers_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "role"
  end

  add_foreign_key "user_numbers", "users"
end
