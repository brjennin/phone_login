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

ActiveRecord::Schema.define(version: 20170803210058) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "phones", force: :cascade do |t|
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["number"], name: "index_phones_on_number"
  end

  create_table "verification_links", force: :cascade do |t|
    t.string "code"
    t.bigint "phone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_verification_links_on_code"
    t.index ["phone_id"], name: "index_verification_links_on_phone_id"
  end

  add_foreign_key "verification_links", "phones"
end
