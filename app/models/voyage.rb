class Voyage < ActiveRecord::Base
  validates :home_port_id, presence: true
  after_create :create_schedule

  has_one    :schedule
  belongs_to :home_port, class_name: 'Location'

  delegate :add_movement, to: :schedule

  def available?
    ValidVoyageRule.new(self).satisfied?
  end

  def why_available
    auditor = Auditor.new
    ValidVoyageRule.new(self).satisfied?(auditor)
    auditor.explain
  end

  delegate :hops, to: :schedule

  def last_location
    schedule.carrier_movements.last.arrival_location
  end

  def last_arrival_at
    schedule.carrier_movements.last.arrival_at
  end
end
