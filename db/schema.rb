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

ActiveRecord::Schema.define(version: 20150214191421) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "citizens", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "clmp_number"
    t.string   "email"
    t.string   "phone_1"
    t.string   "phone_2"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "citizens", ["email"], name: "index_citizens_on_email", unique: true
  add_index "citizens", ["reset_password_token"], name: "index_citizens_on_reset_password_token", unique: true

  create_table "lakes", force: :cascade do |t|
    t.string   "lake_name"
    t.string   "lake_number"
    t.string   "site_number"
    t.string   "county"
    t.float    "sample_depth"
    t.boolean  "previous_year"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "samples", force: :cascade do |t|
    t.integer  "lake_id"
    t.integer  "citizen_id"
    t.date     "date"
    t.time     "time"
    t.float    "secchi_depth"
    t.boolean  "is_bottom"
    t.integer  "physical_appearance"
    t.integer  "recreational_suitability"
    t.string   "water_color"
    t.text     "notes"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "samples", ["citizen_id"], name: "index_samples_on_citizen_id"
  add_index "samples", ["lake_id"], name: "index_samples_on_lake_id"

end
