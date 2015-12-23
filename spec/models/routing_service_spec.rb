require 'rails_helper'

RSpec.describe RoutingService, type: :model do
  include_context 'exemplar'
  Given(:builder)            { VoyageBuilder.new(Voyage.create!(home_port: origin)) }
  Given(:voyages)            { [ voyage ] }
  Given(:voyage)             { builder.voyage }

  Given(:service)            { RoutingService.new(voyages) }
  Given(:cargo)              { exemplar.cargo(origin: origin, destination: destination) }
  Given(:expected_itinerary) { result.context.itinerary }
  
  context "1 leg to long_beach" do  
    Given(:destination) { long_beach }
    Given               { builder.movement_to(destination) }

    context "invalid" do        
      Given(:origin)    { hong_kong  }
      Given(:lala_land) { dallas  }
      When(:result)  { service.itinerary(origin, lala_land, cargo) }
      Then           { result.error? }
      Then           { result.context.message == "no route could be found" }
    end 
    
    context "valid " do        
      Given(:origin)    { hong_kong  }
      
      When(:result)  { service.itinerary(origin, destination, cargo) }
      Then           { result.ok? } 
      Then           { expected_itinerary }
      Then           { expected_itinerary.hops == 1 }
      Then           { result.context.message == "route found" }
    end 
    
    context "persistent itinerary" do
      Given(:origin)  { hong_kong  }
      Given(:result)  { service.itinerary(origin, destination, cargo) }
      When            { expected_itinerary }
      Then            { expected_itinerary.hops == 1 }
    end

    context "provides adequate layover" do
      Given(:origin)   { hong_kong  }
      Given(:result)   { service.itinerary(origin, destination, cargo) }
      When(:itinerary) { result.context.itinerary }
      Then             { ItineraryProvidesAdequateLayoverRule.new(itinerary).satisfied? }
    end
    
  end
  
  context "2-leg, 3-location in order" do  
    Given(:origin)      { hong_kong  }
    Given(:destination) { seattle    }
    Given               { builder.movement_to(long_beach) }
    Given               { builder.movement_to(seattle) }

    context "_hops" do
      When(:result)  { service.itinerary(origin, destination, cargo) }
      Then           { result.ok? } 
      Then           { expected_itinerary }
      Then           { expected_itinerary.hops == 2 }
    end
    
    context "not adaquate layover when multiple hops" do
      Given(:result)   { service.itinerary(origin, destination, cargo) }
      When(:itinerary) { result.context.itinerary }
      Then             { !ItineraryProvidesAdequateLayoverRule.new(itinerary).satisfied? }
    end

  end
  
  context "3-leg, 4-location loop in order" do
    Given(:origin)      { singapore  }
    Given(:destination) { seattle    }
    Given               { builder.movement_to(hong_kong) }
    Given               { builder.movement_to(long_beach) }
    Given               { builder.movement_to(seattle) }
    
    When(:result)  { service.itinerary(origin, destination, cargo) }
    Then           { result.ok? } 
    Then           { expected_itinerary }
    Then           { expected_itinerary.hops == 3 }
  end
  
end 
