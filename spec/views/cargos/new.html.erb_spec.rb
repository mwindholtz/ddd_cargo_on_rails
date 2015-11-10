require 'rails_helper'

RSpec.describe "cargos/new", type: :view do
  include_context 'exemplar'

  before(:each) do
    @prez  = assign(:prez, CargoPresenter.new)    
  end

  # it "renders new cargo form" do
  #   render
  # 
  #   assert_select "form[action=?][method=?]", cargos_path, "post" do
  #   end
  # end
end
