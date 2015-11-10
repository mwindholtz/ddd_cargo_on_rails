require 'rails_helper'

RSpec.describe "cargos/index", type: :view do
  include_context 'exemplar'

  before(:each) do
    assign(:cargos, [                                                      
      exemplar.cargo,
      exemplar.cargo
    ])
  end

  it "renders a list of cargos" do
    render
  end
end
