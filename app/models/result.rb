class Result 
  attr_reader   :status
  attr_reader   :context
    
  def self.ok 
    new(:ok).add(message: "success") 
  end

  def self.error(message="error")
    new(:error).add(message: message) 
  end

  def self.status(status)
    new(status)
  end

  def add(attrs)   
    attrs.each_pair{|k,v| context[k] = v }
    self
  end

  def ok?
    return false unless status_ok?
    block_given? ? yield(self) : true
  end
  
  def error?
    return false if status_ok?
    block_given? ? yield(self) : true
  end

  def message
    context.message
  end
         
  private 
    def status_ok?      
      status == :ok
    end
 
    def initialize(status)   
      @status = status
      @context = OpenStruct.new
    end
     
end
