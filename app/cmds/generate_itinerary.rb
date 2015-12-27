module Cmds
  class GenerateItinerary < Cmds::Base    
  
    def initialize(cargo_id)
      @cargo_id = cargo_id
      super()
    end

    def call   
      routing_service = RoutingService.new(Voyage.all)  
      cargo = Cargo.find(cargo_id)
      if itinerary = routing_service.itinerary(cargo)  
        Result.ok.add(itinerary: itinerary, cargo_id: cargo_id)
      else
        Result.error.add(message: "No Itinerary could be generated", cargo_id: cargo_id)
      end
    end

    protected 
      attr_reader :cargo_id
  end  
end