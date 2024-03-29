# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_13_041229) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "audition_instruments", force: :cascade do |t|
    t.bigint "audition_id", null: false
    t.bigint "instrument_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "priority"
    t.index ["audition_id"], name: "index_audition_instruments_on_audition_id"
    t.index ["instrument_id"], name: "index_audition_instruments_on_instrument_id"
  end

  create_table "audition_users", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "audition_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["audition_id"], name: "index_audition_users_on_audition_id"
    t.index ["user_id"], name: "index_audition_users_on_user_id"
  end

  create_table "auditions", force: :cascade do |t|
    t.string "school"
    t.datetime "date"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.integer "available_spots"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.boolean "virtual"
    t.string "comment"
    t.string "first_choice"
    t.string "second_choice"
    t.string "third_choice"
    t.bigint "audition_id", null: false
    t.bigint "instrument_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["audition_id"], name: "index_players_on_audition_id"
    t.index ["instrument_id"], name: "index_players_on_instrument_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "audition_instruments", "auditions"
  add_foreign_key "audition_instruments", "instruments"
  add_foreign_key "audition_users", "auditions"
  add_foreign_key "audition_users", "users"
  add_foreign_key "players", "auditions"
  add_foreign_key "players", "instruments"
end
