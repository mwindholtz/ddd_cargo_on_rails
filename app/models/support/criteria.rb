class Criteria
  def initialize
    @chain = []
  end

  def merge(criteria)
    criteria.chain.each do |e|
      add_message(e)
    end
    self
  end

  # sugar
  def add(name, *args)
    add_message(Message.new(name, *args))
  end

  def to_s
    return '' if @chain.empty?
    'target.' + @chain.map(&:to_s).join('.')
  end

  def send_to(target)
    @chain.each do |e|
      target = target.send(*e.sendable)
    end
    target
  end

  def method_missing(sym, *args, &_block)
    add(sym.to_sym, *args)
  end

  # override Kernal.load
  def load
    add(:load)
  end

  def find(*)
    fail 'not supported'
  end

  attr_reader :chain

  private

    def add_message(message)
      @chain << message
    end
end
