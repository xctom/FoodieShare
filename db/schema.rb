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

ActiveRecord::Schema.define(version: 0) do

  create_table "follows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "follower_id"
  end

  add_index "follows", ["follower_id"], name: "index_follows_on_follower_id"
  add_index "follows", ["user_id"], name: "index_follows_on_user_id"

  create_table "marks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tag_id"
  end

  add_index "marks", ["tag_id"], name: "index_marks_on_tag_id"
  add_index "marks", ["user_id"], name: "index_marks_on_user_id"

  create_table "pictures", force: :cascade do |t|
    t.integer "post_id"
    t.string  "img_path"
  end

  add_index "pictures", ["post_id"], name: "index_pictures_on_post_id"

  create_table "places", force: :cascade do |t|
    t.integer "post_id"
    t.integer "restaurant_id"
  end

  add_index "places", ["post_id"], name: "index_places_on_post_id"
  add_index "places", ["restaurant_id"], name: "index_places_on_restaurant_id"

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "post_time"
    t.text     "post_text"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "rating"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "replies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "content"
    t.datetime "time"
  end

  add_index "replies", ["post_id"], name: "index_replies_on_post_id"
  add_index "replies", ["user_id"], name: "index_replies_on_user_id"

  create_table "restaurants", force: :cascade do |t|
    t.string "yelp_id"
    t.string "name"
    t.string "image_url"
    t.string "url"
    t.string "phone"
    t.string "rating_img_url"
    t.float  "rating"
    t.string "location_display_address"
    t.string "snippet_text"
  end

  add_index "restaurants", ["yelp_id"], name: "index_restaurants_on_yelp_id"

  create_table "tags", force: :cascade do |t|
    t.string "tag_name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "password_digest"
    t.string   "profile_pic_path"
    t.integer  "gender"
    t.datetime "id_created_time"
    t.string   "nick_name"
    t.string   "place"
    t.datetime "last_login_time"
  end

end
