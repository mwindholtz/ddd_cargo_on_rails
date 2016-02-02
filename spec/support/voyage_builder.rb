# Used to generate test objects
# it defaults to a 2 day layover, and a 2-day carrier_movement so that test setup is easier.

class VoyageBuilder
  attr_reader :voyage

  DEFAULT_DELAY = 2.days

  def initialize(voyage)
    @voyage = voyage
    if @voyage.hops == 0
      self.prev_location = voyage.home_port
      self.prev_date     = Date.today.to_time
    else
      self.prev_location = voyage.last_location
      self.prev_date     = voyage.last_arrival_at
    end
  end

  def movement_to(location)
    departs_at = delay_from(prev_date)
    arrives_at = delay_from(departs_at)

    voyage.add_movement(prev_location, departs_at, location, arrives_at)

    self.prev_location = location
    self.prev_date = arrives_at
  end

  private

    attr_accessor :prev_location
    attr_accessor :prev_date

    def delay_from(time)
      time.to_time + DEFAULT_DELAY
    end
end
