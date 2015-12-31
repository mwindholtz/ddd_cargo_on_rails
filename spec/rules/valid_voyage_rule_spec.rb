require 'rails_helper'

RSpec.describe ValidVoyageRule, type: :model do
  include_context 'exemplar'
  Given(:builder) { VoyageBuilder.new(Voyage.create!(home_port: hong_kong)) }
  Given(:voyage)  { builder.voyage }
  Given(:auditor) { Auditor.new }

  context "not _satisfied?  voyage no movements" do 
    When(:result)  { ValidVoyageRule.new(voyage).satisfied?(auditor) }
    Then           { ! result } 
    Then           { auditor.explain == 'Schedule is Empty' }
  end 

  context "one movement" do
    Given { builder.movement_to( long_beach) }

    context "not _satisfied?  voyage open loop" do 
      When(:result)  { ValidVoyageRule.new(voyage).satisfied?(auditor) }
      Then           { ! result }
      Then           { auditor.explain == 'Schedule does not end in home port' }
    end 

    context "_satisfied?  voyage 2-hops, no loop" do 
      Given { builder.movement_to( seattle)  }
      When(:result)  { ValidVoyageRule.new(voyage).satisfied?(auditor) }
      Then           { ! result }
      Then           { auditor.explain == 'Schedule does not end in home port' }
    end 

    context "_satisfied?  voyage 2-hops complete loop" do 
      Given { builder.movement_to( hong_kong)  }
      When(:result)  { ValidVoyageRule.new(voyage).satisfied?(auditor) }
      Then           { result }
      Then           { auditor.explain == 'Schedule is complete'}
    end 
  end
  
  
end
