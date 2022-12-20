# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_19_222132) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "alternatives", force: :cascade do |t|
    t.string "comparison_values", default: [], array: true
    t.bigint "summary_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["summary_id"], name: "index_alternatives_on_summary_id"
  end

  create_table "creators", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "device_users", force: :cascade do |t|
    t.string "browser"
    t.string "device_model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emails", force: :cascade do |t|
    t.string "email_address"
    t.boolean "opt_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "device_user_id"
    t.index ["device_user_id"], name: "index_emails_on_device_user_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.text "solution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "theory_chunk_id", null: false
    t.index ["theory_chunk_id"], name: "index_exercises_on_theory_chunk_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "subject_id", null: false
    t.string "objectives", default: [], array: true
    t.integer "theory_chunks_count"
    t.index ["subject_id"], name: "index_lessons_on_subject_id"
  end

  create_table "problems", force: :cascade do |t|
    t.text "description"
    t.string "image_subtitle"
    t.bigint "lesson_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "did_you_know"
    t.text "simon_says"
    t.index ["lesson_id"], name: "index_problems_on_lesson_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "title"
    t.string "subtitle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "creator_id", null: false
    t.index ["creator_id"], name: "index_subjects_on_creator_id"
  end

  create_table "summaries", force: :cascade do |t|
    t.bigint "lesson_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "aftermath"
    t.string "key_points", default: [], array: true
    t.string "sources", default: [], array: true
    t.string "alternative_metrics", default: [], array: true
    t.boolean "show_alternatives", default: false
    t.index ["lesson_id"], name: "index_summaries_on_lesson_id"
  end

  create_table "theory_chunks", force: :cascade do |t|
    t.string "mini_goal"
    t.integer "page_index"
    t.bigint "lesson_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["lesson_id"], name: "index_theory_chunks_on_lesson_id"
  end

  create_table "theory_points", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "theory_chunk_id", null: false
    t.integer "order_index"
    t.index ["theory_chunk_id"], name: "index_theory_points_on_theory_chunk_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "loginable_type"
    t.bigint "loginable_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["loginable_type", "loginable_id"], name: "index_users_on_loginable"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "alternatives", "summaries"
  add_foreign_key "exercises", "theory_chunks"
  add_foreign_key "lessons", "subjects"
  add_foreign_key "problems", "lessons"
  add_foreign_key "subjects", "creators"
  add_foreign_key "summaries", "lessons"
  add_foreign_key "theory_chunks", "lessons"
  add_foreign_key "theory_points", "theory_chunks"
end
