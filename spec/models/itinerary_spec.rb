require 'rails_helper'

RSpec.describe Itinerary, type: :model do

  context "create" do
    Given!(:original_count) { Itinerary.count }
    When(:result)           { Itinerary.create!( ExemplarFactory.itinerary_attrs) }
    Then                    { Itinerary.count == original_count + 1 }
    And                     { result.end_location.code == 'LGB' }
    And                     { result.display_errors == '' }        
  end
end
