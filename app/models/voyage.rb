class Voyage < ActiveRecord::Base
  validates :home_port_id, presence: true

  has_one    :schedule 
  belongs_to :home_port, class_name: 'Location' 
  
end
