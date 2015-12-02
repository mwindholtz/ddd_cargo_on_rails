require 'rails_helper'

RSpec.describe RoutingService, type: :model do
  include_context 'exemplar'
  Given(:legs)    { [] }
  Given(:service) { RoutingService.new(legs) }
  
  context "1 leg to long_beach" do  
    Given  { legs << exemplar.hong_kong_to_long_beach_leg }
    Given(:destination) { long_beach }

    context "invalid" do        
      Given(:origin) { singapore  }
      Given(:cargo)  { exemplar.cargo(origin_id: origin.id) }
      When(:result)  { service.itinerary(origin, destination, cargo) }
      Then           { result.error? }
    end 
    
    context "valid " do        
      Given(:origin) { hong_kong  }
      Given(:cargo)  { exemplar.cargo(origin_id: origin.id) }
      When(:result)  { service.itinerary(origin, destination, cargo) }
      Then           { result.ok? } 
      Then           { result.context.itinerary }
    end 
  end
  
  context "2-leg, 2-location, there and back again" do       
    skip
    Given { legs << exemplar.hong_kong_to_long_beach_leg }
    Given { legs << exemplar.long_beach_to_hong_kong_leg }
  end
  
  context "4-leg, 4-location loop" do
    skip
    Given { legs << exemplar.singapore_to_hong_kong_leg  }
    Given { legs << exemplar.hong_kong_to_long_beach_leg }
    Given { legs << exemplar.long_beach_to_seattle_leg   }
    Given { legs << exemplar.seattle_to_singapore_leg    }        
  end
  
  context "has deadend" do
    skip
    Given { legs << exemplar.seattle_to_dallas_leg }  # deadend
  end
end
