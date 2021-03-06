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

ActiveRecord::Schema.define(version: 20150618075146) do

  create_table "order_items", force: true do |t|
    t.integer  "product_id"
    t.decimal  "product_price"
    t.integer  "quantity"
    t.integer  "total_price"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "unit_price"
  end

  create_table "orders", force: true do |t|
    t.decimal  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "subtotal"
    t.integer  "voucher_id"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "vouchers", force: true do |t|
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price_of_activation"
    t.string   "category"
  end

end
