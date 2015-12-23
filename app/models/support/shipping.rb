module Shipping
  class Error < StandardError; end                          
  class InvalidUnLocode < Error  ; end   
  class InvalidBuilderSequence < Error  ; end   
end