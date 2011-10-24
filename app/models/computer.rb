class Computer < ActiveRecord::Base
# Relationship
  has_many :batteries, :dependent => :nullify 
  has_many :notes, :dependent => :delete_all

  # User Accessable Fields
  attr_accessible :computer_name_en, :computer_name_jp, :computer_model, :computer_serial_number, :computer_jbbp_id, :computer_os_version, :computer_memory, :computer_year_acquired, :computer_warrenty_expires, :computer_status

# Validation Rules
  validates :computer_name_en, :presence => true, :uniqueness => :true
  validates :computer_serial_number, :presence => true, :uniqueness => :true,
  :format => { :with => /[A-Z0-9]{2}-[A-Z0-9]{6}-[A-Z0-9]{3}/, 
    :message => "Format should be XX-XXXXXX-XXX" }
  validates :computer_jbbp_id, :presence => true, :uniqueness => :true


# Scope Settings
  scope :good, where(:computer_status => 'Good')
  scope :minor_issues, where(:computer_status => 'Minor Issues')
  scope :not_working, where(:computer_status => 'Not Working')
  scope :retired, where(:computer_status => 'Retired')
end
