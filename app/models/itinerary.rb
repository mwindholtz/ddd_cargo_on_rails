class Itinerary < ActiveRecord::Base
  
  validates :start_location_id, presence: true
  validates :end_location_id,   presence: true
  validates :arrival_time,      presence: true
  validates :layover_minutes,   presence: true

  belongs_to :start_location,   class_name: 'Location' 
  belongs_to :end_location,     class_name: 'Location' 
  has_many   :legs,             dependent: :destroy
    
  def add_leg(leg)
    self.legs.create(
      load_location_id:      leg.load_location_id,
      load_time:             leg.load_time,
      unload_location_id:    leg.unload_location_id,
      unload_time:           leg.unload_time,
    )
  end
    
  def hops
    legs.count
  end
end
