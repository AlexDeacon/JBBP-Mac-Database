class Note < ActiveRecord::Base
# Relationship
  belongs_to :computer
  belongs_to :battery

# User Accessable Fields
attr_accessible :user_name, :note_text, :computer_id, :battery_id

# Validation Rules
  validates :user_name, :presence => true, :length => { :maximum => 30 }
  validates :note_text, :presence => true, :length => { :maximum => 1000 }

end
