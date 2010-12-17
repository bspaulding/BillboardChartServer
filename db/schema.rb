# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101217033643) do

  create_table "artists", :force => true do |t|
    t.string   "name"
    t.string   "billboard_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chart_instance_items", :force => true do |t|
    t.string   "title"
    t.string   "artist"
    t.string   "album"
    t.string   "image_url"
    t.integer  "position"
    t.integer  "chart_instance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "last_weeks_position"
    t.integer  "weeks_on_chart"
    t.integer  "peak_position"
    t.string   "itunesTrackViewURL"
    t.string   "itunesArtworkURL100"
    t.string   "itunesPreviewURL"
    t.string   "itunesArtworkURL30"
    t.string   "itunesArtworkURL60"
    t.integer  "artist_id"
  end

  create_table "chart_instances", :force => true do |t|
    t.date     "date"
    t.integer  "chart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "charts", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "chart_type"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

end
