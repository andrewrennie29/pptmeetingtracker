# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150328135335) do

  create_table "attendees", force: true do |t|
    t.integer  "meetingid",                  null: false
    t.string   "dept",                       null: false
    t.boolean  "attendance", default: true
    t.boolean  "proxy",      default: false
    t.string   "attendees"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "meetingid"
    t.integer  "noteid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "enteredby"
  end

  create_table "meetings", force: true do |t|
    t.text     "fc",          null: false
    t.date     "meetingdate", null: false
    t.string   "meetingtype", null: false
    t.string   "batchid",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", force: true do |t|
    t.integer  "meetingid",                  null: false
    t.string   "notetype",                   null: false
    t.string   "notetag",                    null: false
    t.string   "details"
    t.boolean  "complete",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "assignedto"
    t.date     "duedate"
  end

  create_table "templates", force: true do |t|
    t.string   "meetingtype"
    t.string   "notecategory"
    t.string   "notedetails"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
