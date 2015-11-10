require 'rails_helper'

RSpec.describe Cargo, type: :model do
  
  
  context "create" do
    Given!(:original_count) { Cargo.count }
    When(:result)           { Cargo.create!( ExemplarFactory.cargo_attrs) }
    Then                    { Cargo.count == original_count + 1 }
    And                     { result.origin_id == 1 }
    And                     { result.weight_kg == 10_000 }    
        
  end
end
