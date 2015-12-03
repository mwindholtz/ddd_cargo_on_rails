require 'rails_helper'

RSpec.describe UnLocode, type: :model do
  Given(:valid_code) { 'AS223' }
  Given(:invalid_code) { 'AS123' }

  context "create and normalize code" do
    Given(:un_locode)  { UnLocode.new(valid_code.downcase) }
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

  context "_==" do
    Given(:upcase)   { UnLocode.new(valid_code ) }
    Given(:downcase) { UnLocode.new(valid_code.downcase ) }
    When(:result)    { upcase == downcase }
    Then             { result }
  end 

  context "_unknown" do
    When(:unknown) { UnLocode.unknown }
    Then           { unknown.value == 'XXXXXX'}
  end
  
  context "create with and existing UnLocode" do  
    Given(:existing_code) { UnLocode.new(valid_code)    }
    When(:result)         { UnLocode.new(existing_code) }
    Then { result == existing_code}  
  end
end