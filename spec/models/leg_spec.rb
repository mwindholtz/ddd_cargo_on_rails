require 'rails_helper'

RSpec.describe Leg, type: :model do
  include_context 'exemplar'

  context 'create' do
    Given!(:original_count) { Leg.count }
    When(:result)           { exemplar.singapore_to_hong_kong_leg }
    Then                    { Leg.count == original_count + 1 }
    And                     { result.unload_location == hong_kong }
  end
end
