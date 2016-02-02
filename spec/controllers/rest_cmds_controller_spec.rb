require 'rails_helper'

RSpec.describe CargosController, type: :controller do
  include_context 'exemplar'

  let(:valid_attributes)     { ExemplarFactory.cargo_attrs }
  let(:invalid_attributes)   { valid_attributes.except(:origin_id) }
  let(:not_found_attributes) { valid_attributes.merge(origin_id: 99) }

  let(:valid_session) { {} }

  let(:object_symbol) { :cargo }
  let(:object)        { exemplar.cargo }
  let(:index_url)     { cargos_url }

  include_examples 'rest_cmds_controller', Cargo, CargoPresenter
end
