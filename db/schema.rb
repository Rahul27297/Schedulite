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

ActiveRecord::Schema.define(version: 20210411203321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.string "user_id"
    t.string "course_number"
    t.string "course_time"
    t.string "course_name"
  end

  create_table "course_faq_ans", force: :cascade do |t|
    t.integer  "question_number"
    t.text     "answer"
    t.string   "course_number"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "course_faqs", force: :cascade do |t|
    t.integer  "number"
    t.text     "question"
    t.string   "course_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "coursedetails", force: :cascade do |t|
    t.string "number"
    t.string "points"
    t.string "coursetype"
    t.string "method_of_inst"
    t.string "detail"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "course_num"
    t.string   "dept"
    t.string   "course_name"
    t.string   "professor"
    t.string   "requirement"
    t.string   "course_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["course_id"], name: "index_likes_on_course_id", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "likes", "courses"
  add_foreign_key "likes", "users"
end
