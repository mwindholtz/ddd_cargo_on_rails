class Cargo < ActiveRecord::Base
  validates :origin_id,        presence: true
  validates :destination_id,   presence: true
  validates :arrival_deadline, presence: true
  validates :weight_kg,        presence: true

  belongs_to :origin,      class_name: 'Location'
  belongs_to :destination, class_name: 'Location'
     
end
