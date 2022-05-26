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

ActiveRecord::Schema[7.0].define(version: 2022_05_25_190433) do
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
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "show_voter_results"
    t.string "access_token", null: false
    t.integer "expected_voters"
    t.string "voting_type"
    t.integer "seats"
    t.index ["user_id"], name: "index_ballots_on_user_id"
  end

  create_table "options", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "question_result_ranks", force: :cascade do |t|
    t.bigint "question_result_id", null: false
    t.bigint "option_id", null: false
    t.integer "rank"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_question_result_ranks_on_option_id"
    t.index ["question_result_id"], name: "index_question_result_ranks_on_question_result_id"
  end

  create_table "question_results", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "ballot_id", null: false
    t.bigint "voter_id", null: false
    t.bigint "option_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ballot_id"], name: "index_question_results_on_ballot_id"
    t.index ["option_id"], name: "index_question_results_on_option_id"
    t.index ["question_id"], name: "index_question_results_on_question_id"
    t.index ["voter_id"], name: "index_question_results_on_voter_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "ballot_id", null: false
    t.string "question_type"
    t.string "title"
    t.text "description"
    t.boolean "randomize_selection"
    t.boolean "voter_abstain"
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

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email", default: "", null: false
    t.datetime "last_login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "password"
    t.bigint "ballot_id"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  create_table "voters", force: :cascade do |t|
    t.string "username", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ballot_id", null: false
    t.string "email", null: false
    t.string "password", null: false
    t.index ["ballot_id"], name: "index_voters_on_ballot_id"
  end

  add_foreign_key "ballot_results", "ballots"
  add_foreign_key "ballot_results", "question_results"
  add_foreign_key "ballots", "users"
  add_foreign_key "options", "questions"
  add_foreign_key "question_result_ranks", "options"
  add_foreign_key "question_result_ranks", "question_results"
  add_foreign_key "question_results", "ballots"
  add_foreign_key "question_results", "options"
  add_foreign_key "question_results", "questions"
  add_foreign_key "question_results", "voters"
  add_foreign_key "questions", "ballots"
end
