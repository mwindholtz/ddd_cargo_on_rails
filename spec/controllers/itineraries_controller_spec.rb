require 'rails_helper'

RSpec.describe ItinerariesController, type: :controller do
  include_context 'exemplar'

  Given(:itinerary) { exemplar.itinerary }

  # def itinerary_attrs(extra = {})
  #   {
  #     start_location_id: singapore.id,
  #     end_location_id:   long_beach.id,
  #     arrival_time:      time_now + 5.days,
  #     layover_minutes:   (60 * 24) + 60,       # TODO remove
  #   }.merge(extra)
  # end

  Given(:cargo)                { exemplar.cargo }
  Given                        { cargo.save! }
  Given(:valid_attributes)     { exemplar.itinerary_attrs }
  Given(:invalid_attributes)   { valid_attributes.except(:start_location_id) }
  Given(:not_found_attributes) { valid_attributes.merge(start_location_id: nil) }

  Given(:valid_session) { {} }

  Given(:object_symbol) { :itinerary }
  Given(:object)        { exemplar.itinerary }
  Given(:index_url)     { itineraries_url }

  include_examples 'rest_cmds_controller', Itinerary, ItineraryPresenter
end
