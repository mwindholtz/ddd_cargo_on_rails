require 'rails_helper'

RSpec.describe CargosController, type: :controller do
  include_context 'exemplar'

  Given(:cargo)                { exemplar.cargo }
  Given(:valid_attributes)     { exemplar.cargo_attrs }
  Given(:invalid_attributes)   { valid_attributes.except(:origin_id) }
  Given(:not_found_attributes) { valid_attributes.merge(destination_id: 0) }

  Given(:valid_session) { {} }

  Given(:object_symbol) { :cargo }
  Given(:object)        { exemplar.cargo }
  Given(:index_url)     { cargos_url }

  include_examples 'rest_cmds_controller', Cargo, CargoPresenter
end
