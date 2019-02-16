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

ActiveRecord::Schema.define(version: 8) do

  create_table "application_settings", force: :cascade do |t|
    t.binary "shuffle_seed"
  end

  create_table "ballot_groups", force: :cascade do |t|
    t.string "name", null: false
    t.string "token", null: false
    t.integer "position_in_ballot"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["token"], name: "index_ballot_groups_on_token", unique: true
    t.index ["user_id"], name: "index_ballot_groups_on_user_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.string "price"
    t.text "information"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_houses_on_deleted_at"
  end

  create_table "images", force: :cascade do |t|
    t.text "url"
    t.text "description"
    t.string "dwelling_type"
    t.integer "dwelling_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_images_on_deleted_at"
    t.index ["dwelling_type", "dwelling_id"], name: "index_images_on_dwelling_type_and_dwelling_id"
  end

  create_table "news_items", force: :cascade do |t|
    t.string "heading"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "comment"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_reviews_on_deleted_at"
    t.index ["house_id"], name: "index_reviews_on_house_id"
  end

  create_table "timetable_items", force: :cascade do |t|
    t.datetime "when"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "crsid"
    t.integer "year_group"
    t.boolean "scholar"
    t.boolean "jcr_president"
    t.boolean "admin"
    t.boolean "blocked"
    t.integer "ballot_group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["ballot_group_id"], name: "index_users_on_ballot_group_id"
  end

end
