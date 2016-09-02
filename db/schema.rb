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

ActiveRecord::Schema.define(version: 20160901140334) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string   "authors"
    t.string   "isbn"
    t.string   "description"
    t.string   "image_link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "kid_id"
    t.string   "title"
  end

  add_index "books", ["kid_id"], name: "index_books_on_kid_id", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.integer  "kid_id"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kids", force: :cascade do |t|
    t.date     "birthdate"
    t.string   "gender"
    t.string   "insuranceprovider"
    t.string   "favfood"
    t.string   "favdrink"
    t.string   "favtoys"
    t.string   "favactivities"
    t.string   "favmusic"
    t.time     "bedtime"
    t.string   "allergies"
    t.string   "physicianname"
    t.string   "physicianphone"
    t.string   "parent1"
    t.string   "parent2"
    t.string   "chores"
    t.string   "nonos"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
    t.integer  "user_id"
    t.string   "avatar"
    t.text     "sleepdetails"
  end

  add_index "kids", ["user_id"], name: "index_kids_on_user_id", using: :btree

  create_table "models", force: :cascade do |t|
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
  end

  add_index "models", ["email"], name: "index_models_on_email", unique: true, using: :btree
  add_index "models", ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true, using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "cast_characters"
    t.string   "company"
    t.string   "trailer_url"
    t.string   "poster"
    t.string   "mpaa_rating"
    t.integer  "kid_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
