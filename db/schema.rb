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

ActiveRecord::Schema.define(:version => 20090120152028) do

  create_table "artists", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",     :limit => 25,  :default => "", :null => false
    t.string   "last_name",      :limit => 25,  :default => "", :null => false
    t.string   "email",          :limit => 100
    t.string   "website",        :limit => 100
    t.string   "phone",          :limit => 12
    t.string   "address_line_1", :limit => 30
    t.string   "address_line_2", :limit => 30
    t.string   "city",           :limit => 30
    t.string   "state",          :limit => 2
    t.string   "zip",            :limit => 10
    t.string   "country",        :limit => 30
    t.string   "artist_image"
    t.text     "notes"
  end

  create_table "artists_paintings", :id => false, :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "artist_id",   :null => false
    t.integer  "painting_id", :null => false
  end

  add_index "artists_paintings", ["artist_id"], :name => "fk_bk_artists"
  add_index "artists_paintings", ["painting_id"], :name => "fk_bk_paintings"

  create_table "comments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "painting_id"
    t.integer  "artist_id"
    t.text     "body"
  end

  create_table "locations", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",           :limit => 25, :default => "", :null => false
    t.string   "address_line_1", :limit => 30
    t.string   "address_line_2", :limit => 30
    t.string   "city",           :limit => 30
    t.string   "state",          :limit => 2
    t.string   "zip",            :limit => 10
    t.string   "country",        :limit => 30
    t.float    "lat"
    t.float    "lng"
  end

  create_table "media", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "paintings", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",                                         :default => "",  :null => false
    t.integer  "medium_id",                                                      :null => false
    t.date     "year"
    t.integer  "length",                                                         :null => false
    t.integer  "width",                                                          :null => false
    t.decimal  "price",          :precision => 10, :scale => 2, :default => 0.0
    t.integer  "location_id"
    t.string   "painting_image"
    t.text     "notes"
  end

  add_index "paintings", ["medium_id"], :name => "fk_paintings_media"
  add_index "paintings", ["location_id"], :name => "fk_paintings_location"

end
