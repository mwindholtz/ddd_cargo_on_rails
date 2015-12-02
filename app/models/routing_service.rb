class RoutingService
  
  def initialize(legs) 
    @legs = legs
  end
  
  def itinerary(cargo)
    if (cargo.origin     == legs.first.load_location) &&
       (cargo.destination == legs.first.unload_location)
      result = Result.ok       
      itinerary = Itinerary.new
      result.add(itinerary: itinerary) 
    else   
      Result.error
    end
  end
  
  private 
    attr_reader :legs 
end