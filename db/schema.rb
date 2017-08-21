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

ActiveRecord::Schema.define(version: 20170817022735) do

  create_table "conferences", force: :cascade do |t|
    t.string   "conference_name"
    t.datetime "conference_date"
    t.integer  "conference_capacity"
    t.integer  "conference_attendance"
    t.text     "conference_description"
    t.string   "conference_speaker"
    t.string   "conference_location"
    t.integer  "Event_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["Event_id"], name: "index_conferences_on_Event_id"
  end

  create_table "event_users", force: :cascade do |t|
    t.integer  "Event_id"
    t.integer  "User_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Event_id"], name: "index_event_users_on_Event_id"
    t.index ["User_id"], name: "index_event_users_on_User_id"
  end

  create_table "events", force: :cascade do |t|
    t.string   "event_name"
    t.datetime "event_startDate"
    t.datetime "event_endDate"
    t.integer  "event_capacity"
    t.integer  "event_attendance"
    t.text     "event_description"
    t.boolean  "event_onlyStudents"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "ticket_conferences", force: :cascade do |t|
    t.boolean  "ticketConference_assistance"
    t.integer  "Ticket_id"
    t.integer  "Conference_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["Conference_id"], name: "index_ticket_conferences_on_Conference_id"
    t.index ["Ticket_id"], name: "index_ticket_conferences_on_Ticket_id"
  end

  create_table "ticket_type_conferences", force: :cascade do |t|
    t.integer  "Ticket_Type_id"
    t.integer  "Conference_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["Conference_id"], name: "index_ticket_type_conferences_on_Conference_id"
    t.index ["Ticket_Type_id"], name: "index_ticket_type_conferences_on_Ticket_Type_id"
  end

  create_table "ticket_types", force: :cascade do |t|
    t.float    "ticketType_price"
    t.string   "ticketType_name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "ticket_reference"
    t.integer  "ticket_ticketTypeId"
    t.string   "ticket_name"
    t.string   "ticket_schoolId"
    t.string   "ticket_email"
    t.boolean  "ticket_sex"
    t.integer  "ticket_age"
    t.string   "ticket_course"
    t.integer  "ticket_semester"
    t.string   "ticket_other"
    t.integer  "ticket_badgeNumber"
    t.boolean  "ticket_registered"
    t.boolean  "ticket_preregistered"
    t.string   "ticket_conference1"
    t.string   "ticket_conference2"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

end
