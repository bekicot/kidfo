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

ActiveRecord::Schema.define(version: 20161116034013) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "families", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "kid_id"
    t.string   "category"
    t.string   "name"
    t.string   "description"
    t.string   "image_link"
    t.string   "book_isbn"
    t.string   "movie_cast"
    t.string   "movie_trailer_url"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "invites", force: :cascade do |t|
    t.string   "email"
    t.integer  "status"
    t.string   "code"
    t.integer  "family_id"
    t.integer  "user_id"
    t.integer  "invite_kind"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "invites", ["code"], name: "index_invites_on_code", using: :btree
  add_index "invites", ["family_id"], name: "index_invites_on_family_id", using: :btree
  add_index "invites", ["status"], name: "index_invites_on_status", using: :btree
  add_index "invites", ["user_id"], name: "index_invites_on_user_id", using: :btree

  create_table "kids", force: :cascade do |t|
    t.string   "name"
    t.date     "birthdate"
    t.string   "gender"
    t.string   "insuranceprovider"
    t.time     "bedtime"
    t.text     "sleeproutine"
    t.string   "allergies"
    t.string   "physicianname"
    t.string   "physicianphone"
    t.string   "parent1"
    t.string   "parent2"
    t.text     "chores"
    t.text     "nonos"
    t.integer  "family_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "avatar"
    t.string   "health_ins_enrollee_id"
    t.string   "health_ins_group_num"
    t.string   "parent1_phone"
    t.string   "parent2_phone"
    t.string   "emerg_contact_1"
    t.string   "emerg_contact_1_phone"
    t.string   "emerg_contact_2"
    t.string   "emerg_contact_2_phone"
    t.integer  "user_id"
  end

  add_index "kids", ["family_id"], name: "index_kids_on_family_id", using: :btree

  create_table "parenthoods", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "family_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "parenthoods", ["family_id"], name: "index_parenthoods_on_family_id", using: :btree
  add_index "parenthoods", ["user_id"], name: "index_parenthoods_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "role"
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
