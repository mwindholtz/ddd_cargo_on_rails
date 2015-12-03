
class UnLocode
  attr_reader :value

  VALID_PATTERN = /[a-zA-Z]{2}[a-zA-Z2-9]{3}/
  
  def initialize(code_string)
    @value = code_string
    valid?
  end

  def valid?
    raise Shipping::InvalidUnLocode.new unless (VALID_PATTERN =~ value)
    true
  end  
  
  def to_s
    value
  end
end
