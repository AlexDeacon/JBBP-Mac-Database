class Computer < ActiveRecord::Base
  validates :computer_name_en, :presence => true, :uniqueness => :true
  validates :computer_serial_number, :presence => true, :uniqueness => :true,
  :format => { :with => /[A-Z0-9]{2}-[A-Z0-9]{6}-[A-Z0-9]{3}/, :message => "Format should be XX-XXXXXX-XXX" }
  validates :computer_jbbp_id, :presence => true, :uniqueness => :true

  has_many :batteries, :dependent => :nullify # don't delete battery just set 
                                           # foreign key to null
end
