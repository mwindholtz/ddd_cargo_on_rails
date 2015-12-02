class RoutingService
  
  def initialize(legs) 
    @legs = legs
  end
  
  def itinerary(origin, destination, cargo)
    if (origin      == legs.first.load_location) &&
       (destination == legs.first.unload_location)
      result = Result.ok       
      itinerary = Itinerary.new
      # itinerary.legs(legs.first, legs.last)
      result.add(itinerary: itinerary) 
    else   
      Result.error
    end
  end
  
  private 
    attr_reader :legs 
end