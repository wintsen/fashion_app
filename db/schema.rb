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

ActiveRecord::Schema.define(:version => 20121214061903) do

  create_table "comment_items", :id => false, :force => true do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comment_items", ["item_id"], :name => "index_comment_items_on_item_id"
  add_index "comment_items", ["user_id"], :name => "index_comment_items_on_user_id"

  create_table "comment_pairings", :id => false, :force => true do |t|
    t.integer  "pairing_id"
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comment_pairings", ["pairing_id"], :name => "index_comment_pairings_on_pairing_id"
  add_index "comment_pairings", ["user_id"], :name => "index_comment_pairings_on_user_id"

  create_table "images", :force => true do |t|
    t.string   "original_url"
    t.string   "large_url"
    t.string   "medium_url"
    t.string   "small_url"
    t.string   "thumb_url"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "images", ["imageable_id", "imageable_type"], :name => "index_images_on_imageable_id_and_imageable_type"

  create_table "items", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
  end

  add_index "items", ["user_id"], :name => "index_items_on_user_id"

  create_table "like_items", :id => false, :force => true do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "like_items", ["item_id", "user_id"], :name => "index_like_items_on_item_id_and_user_id", :unique => true
  add_index "like_items", ["item_id"], :name => "index_like_items_on_item_id"
  add_index "like_items", ["user_id"], :name => "index_like_items_on_user_id"

  create_table "like_pairings", :id => false, :force => true do |t|
    t.integer  "pairing_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "like_pairings", ["pairing_id", "user_id"], :name => "index_like_pairings_on_pairing_id_and_user_id", :unique => true
  add_index "like_pairings", ["pairing_id"], :name => "index_like_pairings_on_pairing_id"
  add_index "like_pairings", ["user_id"], :name => "index_like_pairings_on_user_id"

  create_table "pairing_items", :id => false, :force => true do |t|
    t.integer  "pairing_id"
    t.integer  "item_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pairing_items", ["item_id"], :name => "index_pairing_items_on_item_id"
  add_index "pairing_items", ["pairing_id", "item_id"], :name => "index_pairing_items_on_pairing_id_and_item_id", :unique => true
  add_index "pairing_items", ["pairing_id"], :name => "index_pairing_items_on_pairing_id"

  create_table "pairings", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pairings", ["user_id"], :name => "index_pairings_on_user_id"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
