require 'rails_helper'

RSpec.describe Cmds::GenerateItinerary, type: :model do
  include_context 'exemplar'
  Given(:cargo) { ExemplarFactory.cargo } 
  Given             { exemplar.create_voyages }

  context "_call success" do
    Given(:itinerary) { Itinerary.create!( ExemplarFactory.itinerary_attrs) }
    Given             { expect_any_instance_of(RoutingService).to receive(:itinerary).and_return(Result.ok) }
  
    When(:result)     { Cmds::GenerateItinerary.new(cargo.id).call }
    Then              { result.ok? }
  end 

  # context "_call, no itinerary possible" do
  #   Given(:itinerary) { Itinerary.create!( ExemplarFactory.itinerary_attrs) }
  #   Given             { expect_any_instance_of(RoutingService).to receive(:itinerary).and_return(itinerary) }
  # 
  #   When(:result)     { Cmds::GenerateItinerary.new(cargo.id).call }
  #   Then              { result.ok? }
  # end 

end
