require 'rails_helper'

RSpec.describe ItineraryBookingsController, type: :controller do

  include_context 'exemplar'
  Given(:cargo)    {  exemplar.cargo }
  Given(:generate_itinerary_attributes)  { { cargo_id: cargo.id } }

  context  "Post #generate_itinerary " do            
    Given(:itinerary)  { exemplar.itinerary }
    Given(:ok_result)  { Result.ok.add(itinerary: itinerary, cargo_id: cargo.id) }
    Given { expect_any_instance_of(Cmds::GenerateItinerary).to receive(:call).and_return(ok_result) } 
    When  { post :generate_itinerary, generate_itinerary_attributes }
    Then  { expect(assigns(:prez).target).to eq(itinerary) }
    Then  { expect(response).to redirect_to(itinerary) }
    
  end

  context  "Post #generate_itinerary, fails " do            
    Given(:itinerary)  { exemplar.itinerary }
    Given(:ok_result)  { Result.error.add(message: "No Itinerary could be generated", cargo_id: cargo.id)  }
    Given { expect_any_instance_of(Cmds::GenerateItinerary).to receive(:call).and_return(ok_result) } 
    When  { post :generate_itinerary, generate_itinerary_attributes }
    Then  { expect(assigns(:prez).target).to eq(cargo) }
    Then  { expect(response).to redirect_to(cargo) }
    Then  { expect(flash.now).to display_alert('No Itinerary could be generated') }
    
  end

end