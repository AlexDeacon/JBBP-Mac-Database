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

ActiveRecord::Schema.define(:version => 20110923204220) do

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

end
