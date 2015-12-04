class Schedule < ActiveRecord::Base
  belongs_to :voyage
  has_many :carrier_movements

  def add_movement(departure_location, depart_at, arrival_location, arrival_at)
    carrier_movements.create(
        depart_location:  departure_location,
        depart_at:        depart_at,
        arrival_location: arrival_location,
        arrival_at:       arrival_at )
  end 
      
  def hops 
    carrier_movements.count
  end
end
