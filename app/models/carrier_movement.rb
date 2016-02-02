class CarrierMovement < ActiveRecord::Base
  validates :depart_location_id,  presence: true
  validates :depart_at,           presence: true
  validates :arrival_location_id, presence: true
  validates :arrival_at,          presence: true

  belongs_to :schedule
  belongs_to :depart_location, class_name: 'Location'
  belongs_to :arrival_location, class_name: 'Location'
end
