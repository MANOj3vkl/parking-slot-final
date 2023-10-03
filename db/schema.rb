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

ActiveRecord::Schema.define(version: 2023_10_03_062206) do

  create_table "parking_slots", force: :cascade do |t|
    t.integer "number"
    t.integer "entry_point"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicle_histories", force: :cascade do |t|
    t.integer "vehicle_id", null: false
    t.integer "entry_point"
    t.integer "parking_slot_id", null: false
    t.string "status"
    t.datetime "entered_at"
    t.datetime "exited_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parking_slot_id"], name: "index_vehicle_histories_on_parking_slot_id"
    t.index ["vehicle_id"], name: "index_vehicle_histories_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "registration_number"
    t.integer "parking_slot_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "entry_point"
    t.datetime "entry_time"
    t.index ["parking_slot_id"], name: "index_vehicles_on_parking_slot_id"
  end

  add_foreign_key "vehicle_histories", "parking_slots"
  add_foreign_key "vehicle_histories", "vehicles"
  add_foreign_key "vehicles", "parking_slots"
end
