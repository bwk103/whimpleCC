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

ActiveRecord::Schema.define(version: 20180518091802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battings", force: :cascade do |t|
    t.integer "games"
    t.integer "innings"
    t.integer "not_outs"
    t.integer "runs"
    t.integer "high_score"
    t.decimal "average"
    t.integer "fifties"
    t.integer "hundreds"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "player_id"
    t.index ["player_id"], name: "index_battings_on_player_id"
  end

  create_table "bowlings", force: :cascade do |t|
    t.float "overs"
    t.integer "maidens"
    t.integer "runs"
    t.integer "wickets"
    t.string "best"
    t.integer "five_for"
    t.float "economy"
    t.float "strike_rate"
    t.float "average"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "player_id"
    t.index ["player_id"], name: "index_bowlings_on_player_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "ground"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "lat"
    t.float "lng"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "date"
    t.string "location"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ticketed", default: false
  end

  create_table "fieldings", force: :cascade do |t|
    t.integer "catches"
    t.integer "stumpings"
    t.integer "run_outs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "player_id"
    t.index ["player_id"], name: "index_fieldings_on_player_id"
  end

  create_table "fixtures", force: :cascade do |t|
    t.string "opponent"
    t.string "location"
    t.string "result"
    t.string "whimple_score"
    t.string "opponent_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "match_start"
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "surname"
    t.string "email"
    t.integer "team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.text "bio"
    t.index ["surname"], name: "index_players_on_surname"
    t.index ["team"], name: "index_players_on_team"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "email"
    t.string "phone"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sponsors_on_name"
  end

  add_foreign_key "battings", "players"
  add_foreign_key "bowlings", "players"
  add_foreign_key "fieldings", "players"
end
