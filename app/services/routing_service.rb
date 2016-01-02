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
      raise Shipping::ImpossibleCarrierMovement.new("No Voyages Have been Defined")
    end
    
    @schedule = voyages.first.schedule

    if movements.empty?
      raise Shipping::ImpossibleCarrierMovement.new("No Carrier Movements Available")
    end
  end
  
  def itinerary(cargo, origin=nil, destination=nil)
    # TODO must be generalized 
    # Matches only first leg of first voyage 
    if (origin      == movements.first.depart_location) && 
       (destination == movements.first.arrival_location)
      destroy_previous_itineraries(cargo)
      itinerary = build_itinerary(cargo, origin, destination)
      Result.ok.add(itinerary: itinerary, message: "route found", cargo_id: cargo.id) 
    else   
      Result.error.add(message: "No Itinerary could be generated", cargo_id: cargo.id)
    end
  end
  
  private 
    attr_reader :schedule

    def destroy_previous_itineraries(cargo)
      Itinerary.destroy_all("cargo_id = '#{cargo.id}'")
    end
        
    def build_itinerary(cargo, origin, destination)
      itinerary = Itinerary.create(
        cargo:             cargo,
        start_location_id: origin.id,
        end_location_id:   destination.id,
        arrival_time:      cargo.arrival_deadline_on,
        layover_minutes: 0
      )

      # TODO must be generalized 
      # Matches only first leg of first voyage 
      movement = movements.first
      itinerary.legs.create(
        load_location:   movement.depart_location,
        load_time:       movement.depart_at,
        unload_location: movement.arrival_location,
        unload_time:     movement.arrival_at,
      )
      itinerary
    end
    
    def movements
      schedule.carrier_movements
    end
    
end