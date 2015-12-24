require 'rails_helper'

RSpec.describe Schedule, type: :model do
  include_context 'exemplar'
  
  context "create" do
    Given!(:original_count) { Schedule.count }
    When(:result)           { Schedule.create!( ExemplarFactory.schedule_attrs) }
    Then                    { Schedule.count == original_count + 1 }        
  end

  context "instance exists" do 
    Given(:schedule)  { ExemplarFactory.schedule }
    
    context "_add_movement one" do 
      Given!(:original_movements_count)    { CarrierMovement.count }
      When { schedule.add_movement(hong_kong, Future.new(3).to_time, long_beach, Future.new(13).to_time ) } 
      Then { schedule.hops == 1 } 
      Then { CarrierMovement.count == original_movements_count + 1 } 
    end 

    context "_add_movement two-loop" do 
      Given { schedule.add_movement(hong_kong,  Future.new(3).to_time,  long_beach, Future.new(13).to_time ) }  
      Given { schedule.add_movement(long_beach, Future.new(15).to_time, hong_kong,  Future.new(25).to_time ) } 
      Then  { schedule.hops == 2 }
    end 

    # context "_add_movement, fails, non-connected " do 
    #   Given         { schedule.add_movement(hong_kong, Future.new(3).to_time,  long_beach, Future.new(13).to_time ) }  
    #   When(:result) { schedule.add_movement(seattle,   Future.new(15).to_time, hong_kong,  Future.new(25).to_time ) } 
    #   Then          { result == Failure( Shipping::ImpossibleCarrierMovement ) }
    # end 

  end 

end
