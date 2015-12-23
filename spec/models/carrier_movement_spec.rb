require 'rails_helper'

RSpec.describe CarrierMovement, type: :model do
  include_context 'exemplar'
  
  context "create" do
    Given!(:original_count) { CarrierMovement.count }
    When(:result)           { CarrierMovement.create!( ExemplarFactory.carrier_movement_attrs) }
    Then                    { CarrierMovement.count == original_count + 1 }
    Then                    { result }
  end
  
end
