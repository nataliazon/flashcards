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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120521204729) do

  create_table "cards", :force => true do |t|
    t.text     "term"
    t.integer  "user_id"
    t.text     "definition"
    t.boolean  "public"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cards", ["user_id", "created_at"], :name => "index_cards_on_user_id_and_created_at"

  create_table "cards_cardsets", :id => false, :force => true do |t|
    t.integer "cardset_id"
    t.integer "card_id"
  end

  add_index "cards_cardsets", ["card_id", "cardset_id"], :name => "index_cards_cardsets_on_card_id_and_cardset_id", :unique => true

  create_table "cardsets", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "public"
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  create_table "cardsets_cards", :id => false, :force => true do |t|
    t.integer "cardset_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.date     "birthdate"
    t.text     "about"
    t.string   "webpage"
    t.string   "country"
    t.boolean  "active"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
