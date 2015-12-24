require 'rails_helper'

RSpec.describe Recital, type: :model do
  Given(:recital) { Recital.new }
    
  context "_add" do
    When(:result) { recital.add( self, 'message') }
    Then { ! recital.empty? }   
    And  { ! result }
    And  { recital.explain   == 'message' }
  end
  
  context "_add two" do
    Given { recital.add( self, 'message1') }
    When  { recital.add( self, 'message2') }
    Then  { ! recital.empty? }
    And   { recital.explain == 'message1, message2' }
  end
  
  context "break on each object" do
    Given(:object)  { 'object' }
    Given { recital.add( self,   'message1') }
    When  { recital.add( object, 'message2') }
    Then  { recital.explain('<br>') == 'message1<br>message2' }
  end
  
  context "NullRecital" do
    Given(:recital) { Recital::Null.new }

    context "_add" do
      When { recital.add( self, 'message') }
      Then { recital.explain == Recital::Null::MESSAGE }
    end

    context "_add" do
      When(:result) { recital.add( self, 'message') }
      Then { !result }
      And  { recital.explain == Recital::Null::MESSAGE }
    end

  end

end
