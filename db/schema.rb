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

ActiveRecord::Schema.define(version: 20170912141512) do

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "slug"
    t.string  "title",                                    null: false
    t.boolean "advertising",               default: true, null: false
    t.string  "description"
    t.string  "keywords"
    t.text    "content",     limit: 65535
    t.date    "created_on",                               null: false
  end

  create_table "entries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "category"
    t.string   "course"
    t.integer  "parent_id"
    t.integer  "level"
    t.string   "dir2"
    t.string   "tutorial"
    t.string   "title_ru"
    t.string   "title_uk"
    t.string   "title_en"
    t.string   "title_be"
    t.text     "content_ru",      limit: 65535
    t.text     "content_uk",      limit: 65535
    t.text     "content_en",      limit: 65535
    t.text     "content_be",      limit: 65535
    t.string   "dir"
    t.string   "text_file"
    t.text     "maps",            limit: 65535
    t.text     "maps_names_ru",   limit: 65535
    t.text     "maps_names_uk",   limit: 65535
    t.text     "maps_names_en",   limit: 65535
    t.text     "maps_names_be",   limit: 65535
    t.text     "legend",          limit: 65535
    t.text     "legends",         limit: 65535
    t.text     "pictures",        limit: 65535
    t.string   "video_file"
    t.string   "xmlfile"
    t.boolean  "text_with_title",               default: false, null: false
    t.integer  "sequence",                      default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["category"], name: "index_entries_on_category", using: :btree
    t.index ["course"], name: "index_entries_on_course", using: :btree
    t.index ["level"], name: "index_entries_on_level", using: :btree
    t.index ["parent_id"], name: "index_entries_on_parent_id", using: :btree
    t.index ["title_uk", "content_uk", "title_ru", "content_ru", "title_en", "content_en", "title_be", "content_be"], name: "fulltext_multilang_index_entries_on_title_and_content", type: :fulltext
  end

  create_table "terms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                      null: false
    t.integer  "entries_count",             null: false
    t.integer  "popularity",    default: 1, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["name"], name: "index_terms_on_name", unique: true, using: :btree
  end

end
