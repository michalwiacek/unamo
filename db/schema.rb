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

ActiveRecord::Schema.define(version: 20180618114138) do

  create_table "campaigns", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer "website_id"
    t.string "name"
    t.integer "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_groups_on_campaign_id"
  end

  create_table "groups_keywords", id: false, force: :cascade do |t|
    t.integer "keyword_id"
    t.integer "group_id"
    t.index ["group_id"], name: "index_groups_keywords_on_group_id"
    t.index ["keyword_id"], name: "index_groups_keywords_on_keyword_id"
  end

  create_table "keywords", force: :cascade do |t|
    t.integer "group_id"
    t.integer "website_id"
    t.string "name"
    t.integer "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_keywords_on_campaign_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "date"
    t.integer "occurrences"
    t.integer "keyword_id"
    t.index ["keyword_id"], name: "index_positions_on_keyword_id"
  end

end
