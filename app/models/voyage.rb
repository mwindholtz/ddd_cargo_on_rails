class Voyage < ActiveRecord::Base
  validates :home_port_id, presence: true
  after_create :create_schedule
  
  has_one    :schedule 
  belongs_to :home_port, class_name: 'Location' 

  def add_movement(departure_location, depart_at, arrival_location, arrival_at)
    schedule.add_movement(departure_location, depart_at, arrival_location, arrival_at)
  end
  
  def hops
    schedule.hops
  end  
end
