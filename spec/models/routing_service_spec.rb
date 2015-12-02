require 'rails_helper'

RSpec.describe RoutingService, type: :model do
  include_context 'exemplar'
  Given(:legs)               { [] }
  Given(:service)            { RoutingService.new(legs) }
  Given(:cargo)              { exemplar.cargo(origin: origin, destination: destination) }
  Given(:expected_itinerary) { result.context.itinerary }
  
  context "1 leg to long_beach" do  
    Given  { legs << exemplar.hong_kong_to_long_beach_leg }
    Given(:destination) { long_beach }

    context "invalid" do        
      Given(:origin) { singapore  }
      When(:result)  { service.itinerary(origin, destination, cargo) }
      Then           { result.error? }
    end 
    
    context "valid " do        
      Given(:origin)    { hong_kong  }
      
      When(:result)  { service.itinerary(origin, destination, cargo) }
      Then           { result.ok? } 
      Then           { expected_itinerary }
      Then           { expected_itinerary.hops == 1 }
    end 
  end
  
  context "2-leg, 3-location in order" do  
    Given(:origin)      { hong_kong  }
    Given(:destination) { seattle    }

    Given { legs << exemplar.hong_kong_to_long_beach_leg }
    Given { legs << exemplar.long_beach_to_seattle_leg }
    When(:result)  { service.itinerary(origin, destination, cargo) }
    Then           { result.ok? } 
    Then           { expected_itinerary }
    Then           { expected_itinerary.hops == 2 }
  end
  
  context "3-leg, 4-location loop in order" do
    Given(:origin)      { singapore  }
    Given(:destination) { seattle    }
    Given { legs << exemplar.singapore_to_hong_kong_leg  }
    Given { legs << exemplar.hong_kong_to_long_beach_leg }
    Given { legs << exemplar.long_beach_to_seattle_leg   }
    When(:result)  { service.itinerary(origin, destination, cargo) }
    Then           { result.ok? } 
    Then           { expected_itinerary }
    Then           { expected_itinerary.hops == 3 }
  end
  
  context "has deadend" do
    skip
    Given { legs << exemplar.seattle_to_dallas_leg }  # deadend
  end
end
