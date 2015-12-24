class ValidVoyageRule < RuleBase
   
  def initialize(voyage) 
    @voyage = voyage
  end
  
  def satisfied?(recital = Recital.new)
    @recital = recital
    carrier_movements_connected? 
  end 
                                 
  private
    attr_reader :voyage, :recital

    def carrier_movements_connected?
      carrier_movements = voyage.schedule.carrier_movements
      unless carrier_movements.present?
        recital.add( self, 'Schedule is Empty') 
        return false 
      end
      home_port = carrier_movements.first.depart_location
      last_port = carrier_movements.last.arrival_location
      if(home_port == last_port )
        recital.add(self, 'Schedule is complete')
        true
      else
        recital.add(self, 'Schedule does not end in home port')
        false
      end
    end

end 
 