require 'rails_helper'

RSpec.describe UnLocode, type: :model do
  Given(:valid_code) { 'AS223' }
  Given(:invalid_code) { 'AS123' }

  context "create" do
    Given(:un_locode)  { UnLocode.new(valid_code) }
    Then { un_locode.value == valid_code }  
  end

  context "_valid?" do
    Given(:un_locode)  { UnLocode.new(valid_code) }
    Then { un_locode.valid? }  
  end

  context "_valid? raises exception" do
    When(:result)  { UnLocode.new(invalid_code ) }
    Then { result == Failure( Shipping::InvalidUnLocode ) }
  end

end