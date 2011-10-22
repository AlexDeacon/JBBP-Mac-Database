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

ActiveRecord::Schema.define(:version => 20111021204925) do

  create_table "batteries", :force => true do |t|
    t.string   "battery_serial_number"
    t.string   "battery_jbbp_id"
    t.string   "battery_model"
    t.text     "battery_status"
    t.integer  "computer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "batteries", ["computer_id"], :name => "index_batteries_on_computer_id"

  create_table "computers", :force => true do |t|
    t.string   "computer_name_en"
    t.string   "computer_name_jp"
    t.string   "computer_model"
    t.string   "computer_serial_number"
    t.string   "computer_jbbp_id"
    t.string   "computer_os_version"
    t.integer  "computer_memory"
    t.date     "computer_year_acquired"
    t.date     "computer_warrenty_expires"
    t.string   "computer_status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.string   "user_name"
    t.integer  "user_id"
    t.text     "note_text"
    t.integer  "computer_id"
    t.integer  "battery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["battery_id"], :name => "index_notes_on_battery_id"
  add_index "notes", ["computer_id"], :name => "index_notes_on_computer_id"

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                       :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "approved"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
