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

ActiveRecord::Schema.define(version: 20180413054427) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "nit"
    t.string   "mision"
    t.string   "vision"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id"

  create_table "logicals", force: :cascade do |t|
    t.integer  "request_id"
    t.boolean  "redundancy"
    t.boolean  "scalability"
    t.integer  "subnets"
    t.string   "subnet_description"
    t.boolean  "scripts"
    t.boolean  "iptable"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "logicals", ["request_id"], name: "index_logicals_on_request_id"

  create_table "physicals", force: :cascade do |t|
    t.integer  "request_id"
    t.integer  "height"
    t.integer  "width"
    t.integer  "large"
    t.integer  "computers"
    t.boolean  "conference_hall"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "physicals", ["request_id"], name: "index_physicals_on_request_id"

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
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "requests", ["company_id"], name: "index_requests_on_company_id"

  create_table "users", force: :cascade do |t|
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
    t.string   "name"
    t.string   "role"
    t.string   "phone"
    t.integer  "company_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
