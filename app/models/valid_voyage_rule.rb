class ValidVoyageRule < RuleBase
  attr_reader :voyage
   
  def initialize(voyage)
    @voyage = voyage
  end
  
  def satisfied?
    carrier_movements_connected? 
  end 
                                 
  private
    def carrier_movements_connected?
      carrier_movements = voyage.schedule.carrier_movements
      return false unless carrier_movements.present?
      home_port = carrier_movements.first.depart_location
      last_port = carrier_movements.last.arrival_location
      home_port == last_port 
    end

end 
 