class UnLocode
  attr_reader :value

  VALID_PATTERN = /[a-zA-Z]{2}[a-zA-Z2-9]{3}/
  UNKNOWN_CODE  = 'XXXXXX'   

  def self.unknown
    UnLocode.new(UNKNOWN_CODE)
  end  

  def initialize(code_string)
    if code_string.kind_of?(UnLocode)    
      @value = code_string.value 
    else
      @value = code_string.upcase
    end
    valid?
  end

  def valid?
    raise Shipping::InvalidUnLocode.new unless (VALID_PATTERN =~ value)
    true
  end  
  
  def to_s
    value
  end
  
  def ==(other)
    value == other.value
  end

end
