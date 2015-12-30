class ItineraryBookingsController < ApplicationController  
  
  def generate_itinerary 
    result_object = Cmds::GenerateItinerary.new(params[:cargo_id]).call
    
    result_object.ok? do 
      itinerary = result_object.context.itinerary
      @prez = ItineraryPresenter.new(itinerary)
      redirect_to(itinerary) and return
    end
    
    result_object.error? do
      cargo = Cargo.find(params[:cargo_id])
      @prez = CargoPresenter.new(cargo)
      flash.now.alert = result_object.message
      redirect_to(cargo) and return
    end 
    
  end
  
end