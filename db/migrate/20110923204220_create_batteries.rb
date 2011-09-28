class CreateBatteries < ActiveRecord::Migration
  def change
    create_table :batteries do |t|
      t.string :battery_serial_number
      t.string :battery_jbbp_id
      t.string :battery_model
      t.text :battery_status
      t.references :computer

      t.timestamps
    end

    add_index :batteries, :computer_id
  end
end
