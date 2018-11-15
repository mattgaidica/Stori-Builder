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

ActiveRecord::Schema.define(version: 2018_11_15_115400) do

  create_table "annotations", force: :cascade do |t|
    t.text "body"
    t.integer "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_annotations_on_source_id"
  end

  create_table "holds", force: :cascade do |t|
    t.integer "annotation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annotation_id"], name: "index_holds_on_annotation_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "strands", force: :cascade do |t|
    t.integer "position"
    t.integer "thought_id"
    t.integer "annotation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annotation_id"], name: "index_strands_on_annotation_id"
    t.index ["thought_id"], name: "index_strands_on_thought_id"
  end

  create_table "thoughts", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
