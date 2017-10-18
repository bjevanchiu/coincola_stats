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

ActiveRecord::Schema.define(version: 20171018033423) do

  create_table "coincola_advertisements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "country_code"
    t.string "currency"
    t.integer "max_amount"
    t.integer "min_amount"
    t.string "payment_provider"
    t.float "price", limit: 24
    t.integer "advertiser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coincola_advertisers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "avatar"
    t.integer "reputation_id"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coincola_reputations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "feedback_score"
    t.integer "trade_count"
    t.integer "trusted_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
