require 'rails_helper'

RSpec.describe ItinerariesController, type: :controller do

  include_context 'exemplar'

  Given(:itinerary) { exemlpar.itinerary }

  # def itinerary_attrs(extra = {})
  #   {     
  #     start_location_id: singapore.id,
  #     end_location_id:   long_beach.id,
  #     arrival_time:      time_now + 5.days,
  #     layover_minutes:   (60 * 24) + 60,       # TODO remove 
  #   }.merge(extra)
  # end

  let(:valid_attributes)     { exemplar.itinerary_attrs }
  let(:invalid_attributes)   { valid_attributes.except(:start_location_id)  }
  let(:not_found_attributes) { valid_attributes.merge(start_location_id: nil )  }
                                 
  let(:valid_session) { {} }
  
  let(:object_symbol) { :itinerary }
  let(:object)        { exemplar.itinerary }
  let(:index_url)     { itineraries_url }
  
  include_examples "rest_cmds_controller", Itinerary, ItineraryPresenter 
end