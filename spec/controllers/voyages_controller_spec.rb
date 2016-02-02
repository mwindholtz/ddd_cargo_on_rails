require 'rails_helper'

RSpec.describe VoyagesController, type: :controller do
  include_context 'exemplar'

  Given(:voyage) { exemplar.voyage }
  Given(:valid_attributes)     { exemplar.voyage_attrs }
  Given(:invalid_attributes)   { valid_attributes.except(:home_port_id) }
  Given(:not_found_attributes) { valid_attributes.merge(home_port_id: 0) }

  Given(:valid_session) { {} }

  Given(:object_symbol) { :voyage }
  Given(:object)        { exemplar.voyage }
  Given(:index_url)     { voyages_url }

  include_examples 'rest_cmds_controller', Voyage, VoyagePresenter
end
