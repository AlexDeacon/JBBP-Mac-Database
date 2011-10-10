class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :user_name
      t.integer :user_id
      t.text :note_text
      t.references :computer
      t.references :battery

      t.timestamps
    end
    add_index :notes, :computer_id
    add_index :notes, :battery_id
  end
end
