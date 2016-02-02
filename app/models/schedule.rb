class Schedule < ActiveRecord::Base
  belongs_to :voyage
  has_many :carrier_movements

  def add_movement(departure_location, depart_at, arrival_location, arrival_at)
    assert_valid_movement_from(departure_location)

    carrier_movements.create(
      depart_location:  departure_location,
      depart_at:        depart_at,
      arrival_location: arrival_location,
      arrival_at:       arrival_at)
  end

  def hops
    carrier_movements.count
  end

  private

    def assert_valid_movement_from(departure_location)
      unless carrier_movements.empty?
        prev_location = carrier_movements.last.arrival_location
        unless prev_location == departure_location
          fail Shipping::ImpossibleCarrierMovement
        end
      end
    end
end
