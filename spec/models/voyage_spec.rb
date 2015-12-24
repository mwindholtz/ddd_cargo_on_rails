require 'rails_helper'

RSpec.describe Voyage, type: :model do
  include_context 'exemplar'
  
  context "create" do
    Given!(:original_count)    { Voyage.count }
    Given!(:original_schedule) { Schedule.count }
    When                    { Voyage.create!( ExemplarFactory.voyage_attrs) }
    Then                    { Voyage.count   == original_count + 1 }        
    Then                    { Schedule.count == original_schedule + 1 }        
  end

  context "create with voyage_builder two-loop" do 
    Given(:builder) { VoyageBuilder.new(Voyage.create!(home_port: hong_kong)) }
    Given { builder.movement_to( long_beach) }
    Given { builder.movement_to( hong_kong)  }

    When(:voyage) { builder.voyage }
    Then { voyage.hops == 2 }
  end 

  context "instance exists" do 
    Given(:voyage)  { ExemplarFactory.voyage }

    context "_available uses Rule" do 
      Given { expect_any_instance_of(ValidVoyageRule).to receive(:satisfied?) }  
      When  { voyage.available? }
      Then  { }
    end 

  end 
  
end
