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

ActiveRecord::Schema.define(:version => 20080828040107) do

  create_table "friendtests", :force => true do |t|
    t.integer  "user_id",     :limit => 11
    t.integer  "target_xid",  :limit => 11
    t.string   "target_name"
    t.string   "resualt"
    t.boolean  "notified"
    t.boolean  "sent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.integer  "user_id",    :limit => 11
    t.integer  "user_xid",   :limit => 11
    t.integer  "target_xid", :limit => 11
    t.string   "message"
    t.boolean  "notified"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "xid",         :limit => 11
    t.string   "session_key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "age",         :limit => 11
    t.boolean  "sent"
    t.text     "friend_ids"
  end

end
