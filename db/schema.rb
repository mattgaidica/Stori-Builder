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

ActiveRecord::Schema.define(version: 2019_10_06_172321) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acronyms", force: :cascade do |t|
    t.string "term"
    t.boolean "is_master", default: false
    t.integer "like_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["term"], name: "index_acronyms_on_term", unique: true
  end

  create_table "annotations", force: :cascade do |t|
    t.text "body"
    t.bigint "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "body_source"
    t.boolean "is_summary"
    t.index ["source_id"], name: "index_annotations_on_source_id"
  end

  create_table "citations", force: :cascade do |t|
    t.string "cited_as"
    t.boolean "is_read", default: false
    t.bigint "source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_citations_on_source_id"
  end

  create_table "entities", force: :cascade do |t|
    t.string "content"
    t.string "has_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entities_sources", id: false, force: :cascade do |t|
    t.bigint "entity_id", null: false
    t.bigint "source_id", null: false
    t.index ["entity_id", "source_id"], name: "index_entities_sources_on_entity_id_and_source_id"
  end

  create_table "holds", force: :cascade do |t|
    t.bigint "annotation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annotation_id"], name: "index_holds_on_annotation_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "html_file"
    t.string "pdf_link"
    t.string "authors"
  end

  create_table "strands", force: :cascade do |t|
    t.integer "position"
    t.bigint "thought_id"
    t.bigint "annotation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["annotation_id", "thought_id"], name: "index_strands_on_annotation_id_and_thought_id", unique: true
    t.index ["annotation_id"], name: "index_strands_on_annotation_id"
    t.index ["thought_id"], name: "index_strands_on_thought_id"
  end

  create_table "thoughts", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "annotations", "sources"
end
