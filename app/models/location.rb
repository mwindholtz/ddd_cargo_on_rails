class Location < ActiveRecord::Base
  validates :code, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true
  
  def self.selection_options
    result = []
    self.order('name').to_a.each do |e|
      result << [e.name, e.id]
    end
    result
  end
  
end
