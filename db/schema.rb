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

ActiveRecord::Schema.define(version: 3) do

  create_table "cargos", force: :cascade do |t|
    t.integer  "origin_id",        null: false
    t.integer  "destination_id",   null: false
    t.datetime "arrival_deadline", null: false
    t.integer  "weight_kg",        null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "itineraries", force: :cascade do |t|
    t.integer  "start_location_id", null: false
    t.integer  "end_location_id",   null: false
    t.datetime "arrival_time",      null: false
    t.integer  "layover_minutes",   null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
  end

end
