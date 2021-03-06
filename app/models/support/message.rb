class Message
  def initialize(name, args = nil)
    @name = name
    @args = args
  end

  def to_s
    "#{@name}(#{@args})"
  end

  def sendable
    if @args
      [@name.to_sym, @args]
    else
      @name.to_sym
    end
  end
end
