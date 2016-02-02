class ValidVoyageRule < RuleBase
  def initialize(voyage)
    @voyage = voyage
  end

  def satisfied?(auditor = Auditor::Null.new)
    @auditor = auditor
    carrier_movements_connected?
  end

  private

    attr_reader :voyage, :auditor

    def carrier_movements_connected?
      carrier_movements = voyage.schedule.carrier_movements
      unless carrier_movements.present?
        auditor.add(self, 'Schedule is Empty')
        return false
      end
      home_port = carrier_movements.first.depart_location
      last_port = carrier_movements.last.arrival_location
      if home_port == last_port
        auditor.add(self, 'Schedule is complete')
        true
      else
        auditor.add(self, 'Schedule does not end in home port')
        false
      end
    end
end
