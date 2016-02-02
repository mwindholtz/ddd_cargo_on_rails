module Cmds
  class GenerateItinerary < Cmds::Base
    def initialize(cargo_id)
      @cargo_id = cargo_id
      super()
    end

    def call
      routing_service = RoutingGateway.service.new(Voyage.all)
      cargo = Cargo.find(cargo_id)
      routing_service.itinerary(cargo, cargo.origin, cargo.destination)
    end

    protected

      attr_reader :cargo_id
  end
end
