require 'rails_helper'

RSpec.describe "cargos/edit", type: :view do
  include_context 'exemplar'
  
  before(:each) do
    @cargo = assign(:cargo, exemplar.cargo)
  end

  it "renders the edit cargo form" do
    render

    assert_select "form[action=?][method=?]", cargo_path(@cargo), "post" do
    end
  end
end
