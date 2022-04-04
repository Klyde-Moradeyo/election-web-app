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

ActiveRecord::Schema[7.0].define(version: 2022_04_03_145548) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_stat_kcache"
  enable_extension "pg_stat_statements"
  enable_extension "plpgsql"
  enable_extension "set_user"

  create_table "ballot_results", force: :cascade do |t|
    t.bigint "ballot_id", null: false
    t.bigint "question_result_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ballot_id"], name: "index_ballot_results_on_ballot_id"
    t.index ["question_result_id"], name: "index_ballot_results_on_question_result_id"
  end

  create_table "ballots", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "description"
    t.text "URL"
    t.string "ballot_type"
    t.datetime "record_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ballots_on_user_id"
  end

  create_table "guest_voters", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "username"
    t.string "password"
    t.integer "vote_weight"
    t.datetime "record_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_guest_voters_on_user_id"
  end

  create_table "options", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "ballot_id", null: false
    t.string "title"
    t.text "description"
    t.datetime "record_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ballot_id"], name: "index_options_on_ballot_id"
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "isAdmin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_permissions_on_user_id"
  end

  create_table "question_results", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "ballot_id", null: false
    t.text "content"
    t.datetime "record_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ballot_id"], name: "index_question_results_on_ballot_id"
    t.index ["question_id"], name: "index_question_results_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "ballot_id", null: false
    t.string "question_type"
    t.string "title"
    t.text "description"
    t.boolean "randomize_selection"
    t.boolean "voter_abstain"
    t.datetime "record_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ballot_id"], name: "index_questions_on_ballot_id"
  end

  create_table "quote", id: :serial, force: :cascade do |t|
    t.string "quote", limit: 255, null: false
    t.string "author", limit: 255, null: false
    t.timestamptz "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.timestamptz "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["quote"], name: "quote_quote_key", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "username"
    t.string "password"
    t.datetime "last_login"
    t.datetime "record_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "voters", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "username"
    t.string "password"
    t.integer "vote_weight"
    t.datetime "record_updated_at"
    t.boolean "store_voter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_voters_on_user_id"
  end

  add_foreign_key "ballot_results", "ballots"
  add_foreign_key "ballot_results", "question_results"
  add_foreign_key "ballots", "users"
  add_foreign_key "guest_voters", "users"
  add_foreign_key "options", "ballots"
  add_foreign_key "options", "questions"
  add_foreign_key "permissions", "users"
  add_foreign_key "question_results", "ballots"
  add_foreign_key "question_results", "questions"
  add_foreign_key "questions", "ballots"
  add_foreign_key "voters", "users"
end
