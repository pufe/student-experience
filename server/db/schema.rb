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

ActiveRecord::Schema.define(version: 20160521211731) do

  create_table "achievements", force: true do |t|
    t.integer "student_id"
    t.integer "badge_id"
  end

  create_table "adventure_assignments", force: true do |t|
    t.integer  "student_id"
    t.integer  "adventure_id"
    t.boolean  "completed",     default: false
    t.integer  "student_level", default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "adventures", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "subject"
    t.integer  "previous_adventure_id"
    t.datetime "unlocked_at"
  end

  create_table "answer_attempts", force: true do |t|
    t.integer  "mission_assignment_id"
    t.integer  "question_option_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "badges", force: true do |t|
    t.string "icon"
    t.string "name"
    t.text   "description"
  end

  create_table "items", force: true do |t|
    t.boolean "consummable"
    t.string  "name"
    t.string  "icon"
    t.string  "image"
    t.string  "slot"
    t.string  "effect"
    t.integer "gold_price"
    t.integer "cash_price"
  end

  create_table "mission_assignments", force: true do |t|
    t.integer  "adventure_assignment_id"
    t.integer  "mission_id"
    t.boolean  "completed",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "missions", force: true do |t|
    t.string  "name"
    t.text    "description"
    t.integer "level"
    t.integer "adventure_id"
    t.integer "xp_reward"
  end

  create_table "ownerships", force: true do |t|
    t.integer "student_id"
    t.integer "item_id"
    t.integer "quantity"
    t.boolean "equipped"
  end

  create_table "question_hints", force: true do |t|
    t.integer "position"
    t.text    "text"
    t.integer "question_id"
  end

  create_table "question_options", force: true do |t|
    t.boolean "correct",     default: false
    t.text    "text"
    t.integer "question_id"
  end

  create_table "questions", force: true do |t|
    t.text    "description"
    t.integer "mission_id"
    t.integer "difficulty"
    t.integer "gold_reward"
  end

  create_table "students", force: true do |t|
    t.string  "real_name"
    t.string  "email"
    t.string  "password"
    t.string  "nickname"
    t.string  "hair_style"
    t.string  "hair_color"
    t.string  "eye_color"
    t.string  "nose_style"
    t.string  "gender"
    t.string  "skin_color"
    t.string  "uniform"
    t.integer "level",         default: 1
    t.integer "total_xp",      default: 0
    t.integer "current_xp",    default: 0
    t.integer "next_level_xp", default: 100
    t.integer "max_hp",        default: 3
    t.integer "current_hp",    default: 3
    t.integer "gold",          default: 0
    t.integer "cash",          default: 0
  end

end
