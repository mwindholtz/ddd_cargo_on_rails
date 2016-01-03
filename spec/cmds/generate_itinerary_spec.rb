require 'rails_helper'

RSpec.describe Cmds::GenerateItinerary, type: :model do
  include_context 'exemplar'
  Given(:cargo) { ExemplarFactory.cargo } 
  Given             { exemplar.create_voyages }

  context "_call success" do                                        
    Given             { expect_ant_instance_of(RoutingServiceStub).to receive(:itinerary)}
    When(:result)     { Cmds::GenerateItinerary.new(cargo.id).call }
    Then              { }
  end 

end
