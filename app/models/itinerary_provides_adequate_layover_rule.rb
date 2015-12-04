class ItineraryProvidesAdequateLayoverRule
  attr_reader :itinerary
  
  def initialize(itinerary)
    @itinerary = itinerary
  end
  
  def satisfied? 
    itinerary.hops == 1
  end

end