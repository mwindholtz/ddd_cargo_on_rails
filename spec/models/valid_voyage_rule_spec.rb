require 'rails_helper'

# RSpec.describe ValidVoyageRule, type: :model do
#   include_context 'exemplar'
# 
#   Given(:builder) { VoyageBuilder.new(Voyage.create!(home_port: hong_kong)) }
#   Given { builder.movement_to( long_beach) }
#   Given(:voyage) { builder.voyage }
#   
#   context "not _satisfied?  voyage open loop" do 
#     When(:result)  { ValidVoyageRule.new(voyage).satisfied? }
#     Then           { ! result }
#   end 
# 
#   context "_satisfied?  voyage complete loop" do 
#     Given { builder.movement_to( hong_kong)  }
#     When(:result)  { ValidVoyageRule.new(voyage).satisfied? }
#     Then           { result }
#   end 
#   
# end
