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

ActiveRecord::Schema[7.0].define(version: 2023_01_10_153449) do
  create_table "classrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "classroom_id", null: false
    t.integer "service_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_courses_on_classroom_id"
    t.index ["service_id"], name: "index_courses_on_service_id"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.integer "duration"
    t.integer "client_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'inet' for column 'current_sign_in_ip'

  add_foreign_key "courses", "classrooms"
  add_foreign_key "courses", "services"
  add_foreign_key "courses", "users"
end
