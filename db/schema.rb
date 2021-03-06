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

ActiveRecord::Schema.define(version: 20151004153434) do

  create_table "facebook_comments", id: false, force: :cascade do |t|
    t.string   "id"
    t.string   "message"
    t.string   "user_id"
    t.string   "social_media_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "products", id: false, force: :cascade do |t|
    t.string   "id"
    t.string   "gross_amount"
    t.string   "name"
    t.text     "link"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "replies", id: false, force: :cascade do |t|
    t.string   "id"
    t.text     "message"
    t.string   "social_media_id"
    t.string   "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "social_medias", id: false, force: :cascade do |t|
    t.string   "id"
    t.string   "product_id"
    t.integer  "media"
    t.text     "auth_params"
    t.string   "last_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "vtlink_pages", force: :cascade do |t|
    t.integer  "page"
    t.integer  "per_page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
