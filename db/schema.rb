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

ActiveRecord::Schema.define(version: 20150416101657) do

  create_table "buyers", force: true do |t|
    t.string   "ppname"
    t.string   "styleid"
    t.string   "color",      default: "0"
    t.string   "fabric"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.integer  "flag",       default: 0
    t.integer  "price"
    t.string   "category"
  end

  create_table "cart_items", force: true do |t|
    t.integer  "buyer_id"
    t.integer  "cart_id"
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "flag",       default: 0
  end

  create_table "pictures", force: true do |t|
    t.integer  "buyer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "pictures", ["buyer_id"], name: "index_pictures_on_buyer_id", using: :btree

  create_table "size_groups", force: true do |t|
    t.integer  "cart_item_id"
    t.string   "sizecode"
    t.integer  "count",        default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "viewimages", force: true do |t|
    t.string   "image"
    t.string   "title"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
