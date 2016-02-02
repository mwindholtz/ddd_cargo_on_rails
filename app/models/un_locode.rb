class UnLocode # < ValueObject  # it does not allow updates to it's state
  attr_reader :value

  VALID_PATTERN = /[a-zA-Z]{2}[a-zA-Z2-9]{3}/
  UNKNOWN_CODE  = 'XXXXXX'.freeze

  def self.unknown
    UnLocode.new(UNKNOWN_CODE)
  end

  def initialize(code_string)
    @value = if code_string.is_a?(UnLocode)
               code_string.value
             else
               code_string.upcase
             end
    valid?
  end

  def valid?
    fail Shipping::InvalidUnLocode.new unless VALID_PATTERN =~ value
    true
  end

  def to_s
    value
  end

  def ==(other)
    value == other.value
  end
end
