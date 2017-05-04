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

ActiveRecord::Schema.define(version: 20170504035040) do


  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "craftee_id"
    t.integer  "session_id"
    t.string   "invoice_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["craftee_id"], name: "index_bookings_on_craftee_id", using: :btree
    t.index ["session_id"], name: "index_bookings_on_session_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "craftees", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_craftees_on_user_id", using: :btree
  end

  create_table "crafters", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "name"
    t.text     "biography"
    t.string   "profession"
    t.string   "contact_number"
    t.string   "contact_email"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "website_link"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["category_id"], name: "index_crafters_on_category_id", using: :btree
    t.index ["user_id"], name: "index_crafters_on_user_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_link"
    t.string   "location_link"
    t.integer  "crafter_id"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["category_id"], name: "index_events_on_category_id", using: :btree
    t.index ["crafter_id"], name: "index_events_on_crafter_id", using: :btree
  end

  create_table "fav_events", force: :cascade do |t|
    t.integer  "craftee_id"
    t.integer  "event_id"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["craftee_id"], name: "index_fav_events_on_craftee_id", using: :btree
    t.index ["event_id"], name: "index_fav_events_on_event_id", using: :btree
  end

  create_table "featured_crafters", force: :cascade do |t|
    t.string   "media_link"
    t.text     "description"
    t.integer  "crafter_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["crafter_id"], name: "index_featured_crafters_on_crafter_id", using: :btree
  end

  create_table "featured_events", force: :cascade do |t|
    t.string   "media_link"
    t.text     "description"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["event_id"], name: "index_featured_events_on_event_id", using: :btree
  end

  create_table "portfolio_items", force: :cascade do |t|
    t.string   "media_link"
    t.string   "description"
    t.string   "item_type"
    t.integer  "crafter_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["crafter_id"], name: "index_portfolio_items_on_crafter_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "craftee_id"
    t.integer  "event_id"
    t.text     "description"
    t.string   "rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["craftee_id"], name: "index_reviews_on_craftee_id", using: :btree
    t.index ["event_id"], name: "index_reviews_on_event_id", using: :btree
  end

  create_table "sessions", force: :cascade do |t|
    t.integer  "event_id"
    t.date     "datetime_from"
    t.date     "datetime_to"
    t.integer  "price"
    t.integer  "capacity"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["event_id"], name: "index_sessions_on_event_id", using: :btree
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
