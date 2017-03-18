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

ActiveRecord::Schema.define(version: 20170222142642) do

  create_table "entries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "category"
    t.string  "course"
    t.integer "parent_id"
    t.integer "level"
    t.string  "dir2"
    t.string  "tutorial"
    t.string  "title_ru",                                      null: false
    t.string  "title_uk",                                      null: false
    t.string  "title_en",                                      null: false
    t.string  "title_be",                                      null: false
    t.string  "content_ru"
    t.string  "content_uk"
    t.string  "content_en"
    t.string  "content_be"
    t.string  "dir"
    t.string  "text_file"
    t.text    "maps",            limit: 65535,                 null: false
    t.text    "maps_names_ru",   limit: 65535,                 null: false
    t.text    "maps_names_uk",   limit: 65535,                 null: false
    t.text    "maps_names_en",   limit: 65535,                 null: false
    t.text    "maps_names_be",   limit: 65535,                 null: false
    t.text    "legend",          limit: 65535,                 null: false
    t.text    "legends",         limit: 65535,                 null: false
    t.text    "pictures",        limit: 65535,                 null: false
    t.string  "video_file"
    t.string  "xmlfile"
    t.boolean "text_with_title",               default: false, null: false
    t.integer "sequence",                      default: 0,     null: false
    t.index ["category"], name: "index_entries_on_category", using: :btree
    t.index ["course"], name: "index_entries_on_course", using: :btree
    t.index ["level"], name: "index_entries_on_level", using: :btree
    t.index ["parent_id"], name: "index_entries_on_parent_id", using: :btree
  end

end
