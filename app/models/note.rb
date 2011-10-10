class Note < ActiveRecord::Base
  belongs_to :computer
  belongs_to :battery
end
