class Cargo < ActiveRecord::Base
  validates :origin_id,           presence: true
  validates :destination_id,      presence: true
  validates :arrival_deadline_on, presence: true

  belongs_to :origin,      class_name: 'Location'
  belongs_to :destination, class_name: 'Location'
  
  has_one  :itinerary 
  
  def describe
    "#{origin.code} => #{destination.code} by #{arrival_deadline_on}"
  end
     
end
