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
    Given(:builder) { VoyageBuilder.new }
    Given { builder.home_port(hong_kong) }
    Given { builder.movement_to( long_beach) }
    Given { builder.movement_to( hong_kong)  }

    When(:voyage) { builder.voyage }
    Then { voyage.hops == 2 }
  end 

  context "voyage_builder fails" do 
    Given(:builder) { VoyageBuilder.new }
    When(:result) { builder.movement_to( hong_kong)  }
    Then { result == Failure( Shipping::InvalidBuilderSequence ) }
  end 

  context "instance exists" do 
    Given(:voyage)  { ExemplarFactory.voyage }
    
    context "_add_movement one" do 
      Given!(:original_movements_count)    { CarrierMovement.count }
      When { voyage.add_movement(hong_kong, Future.new(3).to_time, long_beach, Future.new(13).to_time ) } 
      Then { voyage.hops == 1 } 
      Then { CarrierMovement.count == original_movements_count + 1 } 
    end 

    context "_add_movement two-loop" do 
      When { voyage.add_movement(hong_kong,  Future.new(3).to_time,  long_beach, Future.new(13).to_time ) }  
      When { voyage.add_movement(long_beach, Future.new(15).to_time, hong_kong,  Future.new(25).to_time ) } 
      Then { voyage.hops == 2 }
    end 

  end 
  
end
