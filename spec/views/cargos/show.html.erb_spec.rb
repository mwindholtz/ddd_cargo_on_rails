require 'rails_helper'

RSpec.describe "cargos/show", type: :view do
  include_context 'exemplar'

  before(:each) do
    @cargo = assign(:cargo, exemplar.cargo)
  end

  it "renders attributes in <p>" do
    render
  end
end
