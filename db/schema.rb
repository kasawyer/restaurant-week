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

ActiveRecord::Schema.define(version: 20170207215838) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
    t.string   "name",                                null: false
    t.string   "avatar"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "dineds", force: :cascade do |t|
    t.integer "user_id",                       null: false
    t.integer "restaurant_id",                 null: false
    t.boolean "marked",        default: false, null: false
    t.index ["restaurant_id"], name: "index_dineds_on_restaurant_id", using: :btree
    t.index ["user_id", "restaurant_id"], name: "index_dineds_on_user_id_and_restaurant_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_dineds_on_user_id", using: :btree
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id",                       null: false
    t.integer "restaurant_id",                 null: false
    t.boolean "marked",        default: false, null: false
    t.index ["restaurant_id"], name: "index_favorites_on_restaurant_id", using: :btree
    t.index ["user_id", "restaurant_id"], name: "index_favorites_on_user_id_and_restaurant_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_favorites_on_user_id", using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name",             null: false
    t.string "image_url",        null: false
    t.string "region",           null: false
    t.string "address",          null: false
    t.string "cuisine"
    t.string "lunch_price"
    t.string "lunch_menu_link"
    t.string "dinner_price"
    t.string "dinner_menu_link"
    t.string "special_notes"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating",        null: false
    t.string   "body",          null: false
    t.integer  "user_id",       null: false
    t.integer  "restaurant_id", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
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
    t.string   "name",                                null: false
    t.string   "avatar"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id",               null: false
    t.integer "review_id",             null: false
    t.integer "value",     default: 0, null: false
    t.index ["review_id"], name: "index_votes_on_review_id", using: :btree
    t.index ["user_id", "review_id"], name: "index_votes_on_user_id_and_review_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
  end

end
