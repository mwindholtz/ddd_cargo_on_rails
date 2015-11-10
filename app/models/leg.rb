class Leg < ActiveRecord::Base
  
  validates :load_location_id,   presence: true
  validates :load_time,          presence: true
  validates :unload_location_id, presence: true
  validates :unload_time,        presence: true

  belongs_to :load_location,     class_name: 'Location' 
  belongs_to :unload_location,   class_name: 'Location' 
  
end 

