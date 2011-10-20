class Battery < ActiveRecord::Base
# Relationship
  belongs_to :computer
  has_many :notes, :dependent => :delete_all

# TODO: Add attr_accessible field here

# Validation Rules
  validates :battery_serial_number, :presence => true, :uniqueness => :true
  validates :battery_jbbp_id, :presence => true, :uniqueness => :true
  validates :computer_id, :uniqueness => :true, :unless => "computer_id==0 || computer_id==nil"

# Scope Settings
  scope :good, where(:battery_status => 'Good')
  scope :weak, where(:battery_status => 'Weak')
  scope :not_working, where(:battery_status => 'Not Working')
  scope :retired, where(:battery_status => 'Retired')
end
