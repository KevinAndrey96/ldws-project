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

ActiveRecord::Schema.define(version: 20180808032049) do

  create_table "binnacles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.string   "action"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "binnacles", ["company_id"], name: "index_binnacles_on_company_id"
  add_index "binnacles", ["user_id"], name: "index_binnacles_on_user_id"

  create_table "buildings", force: :cascade do |t|
    t.string   "name"
    t.integer  "distance"
    t.integer  "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "buildings", ["request_id"], name: "index_buildings_on_request_id"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "nit"
    t.string   "cell"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id"

  create_table "equipment", force: :cascade do |t|
    t.string   "brand"
    t.string   "etype"
    t.string   "reference"
    t.integer  "price"
    t.integer  "ports"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "slots"
    t.integer  "power"
  end

  create_table "logicals", force: :cascade do |t|
    t.integer  "request_id"
    t.integer  "host1"
    t.integer  "host2"
    t.integer  "host3"
    t.integer  "host4"
    t.boolean  "redundancy"
    t.integer  "scalability"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "security"
  end

  add_index "logicals", ["request_id"], name: "index_logicals_on_request_id"

  create_table "physicals", force: :cascade do |t|
    t.integer  "request_id"
    t.integer  "height"
    t.integer  "width"
    t.integer  "large"
    t.integer  "computers"
    t.integer  "printers"
    t.boolean  "conference_hall"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "building_id"
  end

  add_index "physicals", ["building_id"], name: "index_physicals_on_building_id"
  add_index "physicals", ["request_id"], name: "index_physicals_on_request_id"

  create_table "ports", force: :cascade do |t|
    t.string   "name"
    t.integer  "speed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string   "title"
    t.integer  "company_id"
    t.string   "description"
    t.string   "objective"
    t.string   "observation"
    t.boolean  "web"
    t.boolean  "bd"
    t.boolean  "aplications"
    t.boolean  "proxy"
    t.boolean  "voip"
    t.boolean  "video_conference"
    t.boolean  "active_dir"
    t.boolean  "dhcp"
    t.boolean  "dns"
    t.boolean  "ftp"
    t.boolean  "email"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "ctype"
  end

  add_index "requests", ["company_id"], name: "index_requests_on_company_id"

  create_table "subnets", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "computers"
    t.integer  "logical_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "subnets", ["logical_id"], name: "index_subnets_on_logical_id"

  create_table "switches", force: :cascade do |t|
    t.string   "name"
    t.string   "reference"
    t.integer  "price"
    t.integer  "nports"
    t.integer  "port"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "the_switches", force: :cascade do |t|
    t.integer  "switches_id"
    t.integer  "ports_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "numberports"
  end

  add_index "the_switches", ["ports_id"], name: "index_the_switches_on_ports_id"
  add_index "the_switches", ["switches_id"], name: "index_the_switches_on_switches_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "name"
    t.string   "role",                   default: "User"
    t.string   "phone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
