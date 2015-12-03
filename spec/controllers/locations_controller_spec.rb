require 'rails_helper'

RSpec.describe LocationsController, type: :controller do

  include_context 'exemplar'

  let(:valid_attributes)     { {code: 'SGP', name: 'Singapore'} }
  let(:invalid_attributes)   { valid_attributes.except(:name)  }
  let(:not_found_attributes) { valid_attributes.merge(name: 'No where')  }
                                 
  let(:valid_session) { {} }
  
  let(:object_symbol) { :location }
  let(:object)        { exemplar.singapore }
  let(:index_url)     { locations_url }
  
  include_examples "rest_cmds_controller", Location, LocationPresenter 

end
