# When an object has interrogation methods like:  #available? returning true/false
# Sometimes we want to know WHY it returned false.   
# So we pass in a recital, and add reasons to the recital
#   available?(recital)
#  The recital captures the description of why the valuation accieved it's conclusion of (true or false)

class Recital
  
  class Null      
    MESSAGE = 'null-recital'
    def add(object, message); false; end 
    def explain(sep =', '); MESSAGE; end
  end

# aka Auditor, avdi grimm calls this concept 'Auditor'.  
  
  Frame = Struct.new(:object, :message)
  def initialize
    @notes = []
  end
  
  def add(object, message) 
    @notes << Frame.new(object, message)
    false
  end
  
  def empty?
    @notes.empty?
  end

  def explain(sep =', ')  
    list(sep)
  end    
  
  def to_s
    explain
  end
  
  private
    
    def list(sep)
      hash = Hash.new { Array.new }
      @notes.each do |frame|                 
        hash[frame.object] = hash[frame.object] << frame.message
      end
      result = []
      hash.each_pair{|key, value| result <<  value.join(sep)  }
      result.join(sep)
    end
end
