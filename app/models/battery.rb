class Battery < ActiveRecord::Base
  belongs_to :computer

  # TODO: Add attr_accessible field here

  validates :battery_serial_number, :presence => true, :uniqueness => :true
  validates :battery_jbbp_id, :presence => true, :uniqueness => :true
end
