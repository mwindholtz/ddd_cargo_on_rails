require 'rails_helper'

RSpec.describe PdqRoutingService, type: :model do
  include_context 'exemplar'

  Given(:service)            { PdqRoutingService.new(voyages) }
  Given(:cargo)              { exemplar.cargo(origin: hong_kong, destination: long_beach) }

  context '_new must have some voyages' do
    Given(:service)  { PdqRoutingService.new([]) }
    When(:result)    { service.itinerary(cargo) }
    Then             { result.error? }
    Then             { result.message == 'PDQ Routing Service not currently available' }
  end
end
