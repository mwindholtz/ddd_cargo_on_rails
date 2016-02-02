#
#  Real Routing service that should connect to an outside service

class PdqRoutingService
  def initialize(voyages)
  end

  def itinerary(cargo, _origin = nil, _destination = nil)
    Result.error.add(message: 'PDQ Routing Service not currently available', cargo_id: cargo.id)
  end
end
