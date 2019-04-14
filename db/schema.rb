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

ActiveRecord::Schema.define(version: 20190414111702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "flight_id"
    t.integer  "flight_class_id"
    t.integer  "seats"
    t.integer  "user_id"
    t.string   "pnr_number",      limit: 8
    t.boolean  "cancelled",                 default: false
    t.float    "fare"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "seat_layout_id"
  end

  create_table "flight_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flight_classes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flight_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.integer  "flight_type_id"
    t.integer  "user_id"
    t.string   "origin"
    t.string   "destination"
    t.datetime "departure"
    t.datetime "arrival"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.integer  "booking_id"
    t.string   "full_name"
    t.string   "gender"
    t.integer  "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "pretty_id"
    t.string   "pnr"
    t.index ["pretty_id"], name: "index_passengers_on_pretty_id", using: :btree
  end

  create_table "seat_layouts", force: :cascade do |t|
    t.integer  "flight_class_id"
    t.integer  "rows"
    t.integer  "seats"
    t.integer  "total_seats"
    t.integer  "flight_id"
    t.float    "fare"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "available_seats"
  end

  create_table "seats", force: :cascade do |t|
    t.integer  "flight_id"
    t.integer  "seat_layout_id"
    t.string   "seat_no"
    t.integer  "user_id"
    t.integer  "booking_id"
    t.boolean  "allocated",      default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "full_name",              default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
