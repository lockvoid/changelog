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

ActiveRecord::Schema.define(version: 2018_12_20_133224) do

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "viewer_id"
    t.integer "notice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_events_on_name"
    t.index ["notice_id"], name: "index_events_on_notice_id"
    t.index ["viewer_id"], name: "index_events_on_viewer_id"
  end

  create_table "notices", force: :cascade do |t|
    t.string "heading"
    t.string "body"
    t.string "target_element_selector"
    t.integer "release_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["release_id"], name: "index_notices_on_release_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "api_key"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "releases", force: :cascade do |t|
    t.string "name"
    t.string "body"
    t.string "version"
    t.datetime "date"
    t.boolean "published"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_releases_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "display_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "crypted_password"
    t.string "salt"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
