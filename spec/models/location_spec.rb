require 'rails_helper'

RSpec.describe Location, type: :model do
  
  context "create" do
    Given!(:original_count) { Location.count }
    When(:result)           { Location.create(code: 'CVG', name: 'Cincinnati') }
    Then                    { Location.count == original_count + 1 }
    And                     { result.code == 'CVG' } 
  end
  
end
