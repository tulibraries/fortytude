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

ActiveRecord::Schema.define(version: 2018_05_10_185155) do

  create_table "buildings", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "address1"
    t.string "temple_building_code"
    t.string "directions_map"
    t.string "hours"
    t.string "phone_number"
    t.string "image"
    t.string "campus"
    t.text "accessibility"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "email_address"
    t.string "chat_handle"
    t.string "job_title"
    t.string "identifier"
    t.integer "building_id"
    t.integer "space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_people_on_building_id"
    t.index ["space_id"], name: "index_people_on_space_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "hours"
    t.text "accessibility"
    t.string "location"
    t.string "phone_number"
    t.string "image"
    t.string "email"
    t.integer "building_id"
    t.integer "parent_space_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_spaces_on_building_id"
    t.index ["parent_space_id"], name: "index_spaces_on_parent_space_id"
  end

end
