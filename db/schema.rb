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

ActiveRecord::Schema.define(version: 2021_09_28_121408) do

  create_table "application_companies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "detail"
    t.string "reason"
    t.string "contact_name"
    t.string "phone_number"
    t.string "contact_email"
    t.string "string"
    t.string "status_worker"
    t.string "status_project"
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_application_companies_on_project_id"
    t.index ["user_id"], name: "index_application_companies_on_user_id"
  end

  create_table "projects", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "status"
    t.string "concept"
    t.datetime "deadline"
    t.integer "reward"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.string "category"
    t.string "appeal"
    t.string "wish_person"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password"
    t.string "token"
    t.boolean "purpose"
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "application_companies", "projects"
  add_foreign_key "application_companies", "users"
  add_foreign_key "projects", "users"
end
