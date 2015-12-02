class Itinerary < ActiveRecord::Base
  
  validates :start_location_id, presence: true
  validates :end_location_id,   presence: true
  validates :arrival_time,      presence: true
  validates :layover_minutes,   presence: true

  belongs_to :start_location,   class_name: 'Location' 
  belongs_to :end_location,     class_name: 'Location' 
    
  def add_leg(leg)
    @hops ||= 0
    @hops += 1 
  end
    
  def hops
    @hops
  end
end
