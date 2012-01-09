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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120108044333) do

  create_table "clicks", :force => true do |t|
    t.integer  "session_id"
    t.string   "event"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["teacher_id"], :name => "index_courses_on_teacher_id"

  create_table "events", :force => true do |t|
    t.text     "event"
    t.datetime "ts"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periods", :force => true do |t|
    t.string   "hours"
    t.string   "quarter"
    t.integer  "year"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "periods", ["course_id"], :name => "index_periods_on_course_id"

  create_table "periods_students", :id => false, :force => true do |t|
    t.integer "period_id",  :null => false
    t.integer "student_id", :null => false
  end

  add_index "periods_students", ["period_id", "student_id"], :name => "index_periods_students_on_period_id_and_student_id", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.integer  "phone"
    t.string   "name"
    t.integer  "ssn"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "users_email_index"

end
