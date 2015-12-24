module Shipping
  class Error < StandardError; end                          
  class InvalidUnLocode           < Error; end 
  class InvalidBuilderSequence    < Error; end 
  class ImpossibleCarrierMovement < Error; end 

end