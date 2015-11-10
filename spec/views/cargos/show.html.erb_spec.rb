require 'rails_helper'

RSpec.describe "cargos/show", type: :view do
  include_context 'exemplar'

  before(:each) do
    @prez  = assign(:prez, CargoPresenter.new(exemplar.cargo))    
  end

  it "renders attributes in <p>" do
    render
  end
end
