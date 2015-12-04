# used to generate test objects

class VoyageBuilder
  attr_reader :voyage
  
  def home_port=(location)  
    self.prev_location = location
    self.prev_date = Date.today.to_time
    @voyage = Voyage.create!(home_port: location)
  end
  
  def movement_to(location)
    raise Shipping::InvalidBuilderSequence.new("set previous location before adding a movement") unless prev_location
    raise Shipping::InvalidBuilderSequence.new("set home_port before adding a movement") unless voyage
    departs_at = delay_from(prev_date)
    arrives_at = delay_from(departs_at)
    
    voyage.add_movement(prev_location, departs_at , location, arrives_at ) 

    self.prev_location = location
    self.prev_date = arrives_at
  end 
   
  private 
    attr_accessor :prev_location
    attr_accessor :prev_date

    def delay_from(time)
      time.to_time + 2.days
    end
    
end