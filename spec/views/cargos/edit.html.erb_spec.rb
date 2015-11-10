require 'rails_helper'

RSpec.describe "cargos/edit", type: :view do
  include_context 'exemplar'
  
  before(:each) do
    @prez  = assign(:prez, CargoPresenter.new(exemplar.cargo))
  end

  it "renders the edit cargo form" do
    render

    assert_select "form[action=?][method=?]", cargo_path(@prez.target), "post" do
    end
  end
end
