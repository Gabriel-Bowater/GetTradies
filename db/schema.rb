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

ActiveRecord::Schema.define(version: 20150902052756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "price"
    t.string   "location",                           null: false
    t.string   "job_type"
    t.string   "title"
    t.text     "description"
    t.string   "photo_url"
    t.datetime "paid_at"
    t.boolean  "completed",          default: false, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "tenders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "job_id"
    t.boolean  "accepted",   default: false, null: false
    t.integer  "rating"
    t.text     "comment"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "given_name"
    t.string   "family_name"
    t.string   "email",                                   null: false
    t.string   "profession",         default: "customer", null: false
    t.string   "address"
    t.text     "description"
    t.decimal  "rates"
    t.string   "phone_number"
    t.string   "password_hash",                           null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

end
