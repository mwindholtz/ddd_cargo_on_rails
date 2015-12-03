class RoutingService
  
  def initialize(legs) 
    @legs = legs
  end
  
  def itinerary(origin, destination, cargo)
    if (origin      == legs.first.load_location) &&
       (destination == legs.last.unload_location)
      result = Result.ok       
      itinerary = Itinerary.create(
        start_location_id: origin.id,
        end_location_id:   destination.id,
        arrival_time:      cargo.arrival_deadline_on,
        layover_minutes: 0
      )
      legs.each{ |leg| itinerary.add_leg(leg) }
      result.add(itinerary: itinerary, message: "route found") 
    else   
      Result.error.add(message: "no route could be found")
    end
  end
  
  private 
    attr_reader :legs 
end