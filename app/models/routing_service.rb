# For demo simplicity the routing service uses only the first voyage in the list.
# It also simply starts at the voyage beginning and voyage end.

# Routing Short cut:
# 
# Find a voyage that goes from origin to destination.
# create iteinerary legs for each of the carrier_movements
# 

class RoutingService
 
  def initialize(voyages)  
    if voyages.empty?
      raise Shipping::ImpossibleCarrierMovement
    end
    
    @schedule = voyages.first.schedule
  end
  
  def itinerary(cargo, origin=nil, destination=nil)
    if (origin      == movements.first.depart_location) &&
       (destination == movements.last.arrival_location)
      result = Result.ok       
      itinerary = Itinerary.create(
        start_location_id: origin.id,
        end_location_id:   destination.id,
        arrival_time:      cargo.arrival_deadline_on,
        layover_minutes: 0
      )

      movements.each do |movement| 
        itinerary.legs.create(
          load_location:   movement.depart_location,
          load_time:       movement.depart_at,
          unload_location: movement.arrival_location,
          unload_time:     movement.arrival_at,
        )
      end
      result.add(itinerary: itinerary, message: "route found") 
    else   
      Result.error.add(message: "no route could be found")
    end
  end
  
  private 
    attr_reader :schedule

    def movements
      schedule.carrier_movements
    end
    
end