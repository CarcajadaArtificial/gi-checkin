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

ActiveRecord::Schema.define(version: 20170821065912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conferences", force: :cascade do |t|
    t.string "conference_name"
    t.datetime "conference_date"
    t.integer "conference_capacity"
    t.integer "conference_attendance"
    t.text "conference_description"
    t.string "conference_speaker"
    t.string "conference_location"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_conferences_on_event_id"
  end

  create_table "event_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_users_on_event_id"
    t.index ["user_id"], name: "index_event_users_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "event_name"
    t.datetime "event_startDate"
    t.datetime "event_endDate"
    t.integer "event_capacity"
    t.integer "event_attendance"
    t.text "event_description"
    t.boolean "event_onlyStudents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ticket_conferences", force: :cascade do |t|
    t.boolean "TicketConference_assistance"
    t.bigint "ticket_id"
    t.bigint "conference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conference_id"], name: "index_ticket_conferences_on_conference_id"
    t.index ["ticket_id"], name: "index_ticket_conferences_on_ticket_id"
  end

  create_table "ticket_types", force: :cascade do |t|
    t.float "ticketType_price"
    t.string "ticketType_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "ticket_reference"
    t.integer "ticket_ticketTypeId"
    t.string "ticket_name"
    t.string "ticket_schoolId"
    t.string "ticket_email"
    t.string "ticket_sex"
    t.integer "ticket_age"
    t.string "ticket_course"
    t.integer "ticket_semester"
    t.string "ticket_university"
    t.string "ticket_other"
    t.integer "ticket_badgeNumber"
    t.string "ticket_conference1"
    t.string "ticket_conference2"
    t.boolean "ticket_preregistered"
    t.boolean "ticket_registered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "conferences", "events"
  add_foreign_key "event_users", "events"
  add_foreign_key "event_users", "users"
  add_foreign_key "ticket_conferences", "conferences"
  add_foreign_key "ticket_conferences", "tickets"
end
