require 'rails_helper'

RSpec.describe GenericPresenter, type: :model do
  
  context "_presenter" do
    Given(:target)     { "Some Object To Present "}
    Given!(:presenter) { GenericPresenter.new( target ) }
    Then               { target == presenter.target }
  end
end
