require 'rails_helper'

RSpec.describe Voyage, type: :model do
  include_context 'exemplar'
  
  context "create" do
    Given!(:original_count) { Voyage.count }
    When(:result)           { Voyage.create!( ExemplarFactory.voyage_attrs) }
    Then                    { Voyage.count == original_count + 1 }        
  end

  context "instance exists" do 
    Given(:voyage)  { ExemplarFactory.voyage }
    
    context "_add_movement" do 
      When(:result) { voyage.add_movement() }
    end 
  end 
  
end
