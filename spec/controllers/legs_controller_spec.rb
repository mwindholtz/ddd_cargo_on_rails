require 'rails_helper'

RSpec.describe LegsController, type: :controller do

  include_context 'exemplar'

  let(:valid_attributes) { 
    { load_location_id:   seattle.id,
      load_time:          exemplar.time_now(1).to_s, # "2015-12-02 17:41:51 -0500"
      unload_location_id: singapore.id,
      unload_time:        exemplar.time_now(20).to_s
    }  
  }
  let(:invalid_attributes)   { valid_attributes.except(:unload_location_id)  }
  let(:not_found_attributes) { valid_attributes.merge(load_location_id: 999) }
                                 
  let(:valid_session) { {} }
  
  let(:object_symbol) { :leg }
  let(:object)        { exemplar.seattle_to_singapore_leg }
  let(:index_url)     { legs_url }
  
  include_examples "rest_cmds_controller", Leg, LegPresenter 

end
