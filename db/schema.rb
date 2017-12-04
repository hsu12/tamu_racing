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

ActiveRecord::Schema.define(version: 20171127020638) do

  create_table "applies", force: :cascade do |t|
    t.string   "name"
    t.string   "uin"
    t.string   "cellphone"
    t.string   "email"
    t.string   "course_fall"
    t.string   "course_credit_fall"
    t.string   "course_spring"
    t.string   "course_credit_spring"
    t.string   "major"
    t.string   "GPR_major"
    t.string   "GPR_overall"
    t.string   "employement"
    t.boolean  "flag_participate_SAE"
    t.string   "participate_SAE"
    t.boolean  "flag_grassroots"
    t.string   "grassroots"
    t.boolean  "flag_SAE_officer"
    t.string   "SAE_officer"
    t.boolean  "flag_Other"
    t.string   "Other"
    t.text     "activities_description"
    t.text     "motivation"
    t.text     "hands_on_activities"
    t.text     "leadership"
    t.text     "skills"
    t.text     "preference"
    t.boolean  "acknoledgement"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id"
    t.boolean  "admission"
    t.text     "comment"
  end

  create_table "applyas", force: :cascade do |t|
    t.string   "name"
    t.string   "uin"
    t.string   "email"
    t.string   "course_401"
    t.string   "FSAE_interest"
    t.string   "FSAE_as_senoir"
    t.string   "FSAE_experience"
    t.string   "sub_team"
    t.string   "current_course"
    t.string   "user_id"
    t.text     "comment"
    t.boolean  "admission"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["type"], name: "index_ckeditor_assets_on_type"

  create_table "order_items", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "order_id"
    t.decimal  "unit_price",  precision: 12, scale: 3
    t.integer  "quantity"
    t.decimal  "total_price", precision: 12, scale: 3
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "size",                                 default: "M"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id"

  create_table "orders", force: :cascade do |t|
    t.decimal  "subtotal",   precision: 12, scale: 3
    t.decimal  "tax",        precision: 12, scale: 3
    t.decimal  "shipping",   precision: 12, scale: 3
    t.decimal  "total",      precision: 12, scale: 3
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "status",                              default: "Placed"
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "phone"
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",              precision: 12, scale: 3
    t.boolean  "active"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "manageFlag"
    t.integer  "apply0"
    t.integer  "apply1"
    t.integer  "apply2"
  end

  create_table "widgets", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
