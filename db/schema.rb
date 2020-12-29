# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_29_145300) do

  create_table "author_books", force: :cascade do |t|
    t.integer "author_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_author_books_on_author_id"
    t.index ["book_id"], name: "index_author_books_on_book_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.boolean "duplicate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reference_duplicates", force: :cascade do |t|
    t.integer "reference_id", null: false
    t.integer "duplicate_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["duplicate_id"], name: "index_reference_duplicates_on_duplicate_id"
    t.index ["reference_id"], name: "index_reference_duplicates_on_reference_id"
  end

  add_foreign_key "author_books", "authors"
  add_foreign_key "author_books", "books"
  add_foreign_key "reference_duplicates", "books", column: "duplicate_id"
  add_foreign_key "reference_duplicates", "books", column: "reference_id"
end
