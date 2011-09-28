class CreateComputers < ActiveRecord::Migration
  def change
    create_table :computers do |t|
      t.string :computer_name_en
      t.string :computer_name_jp
      t.string :computer_model
      t.string :computer_serial_number
      t.string :computer_jbbp_id
      t.string :computer_os_version
      t.integer :computer_memory
      t.date :computer_year_acquired
      t.date :computer_warrenty_expires
      t.string :computer_status

      t.timestamps
    end
  end
end
