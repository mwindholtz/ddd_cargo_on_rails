class Location < ActiveRecord::Base
  validates :un_locode, presence: true, uniqueness: true
  validates :name,      presence: true, uniqueness: true

  self.composed_of :code,  class_name: "UnLocode",  mapping: [ [:un_locode, :value] ]

  def code=(value)  
    self.un_locode = UnLocode.new(value).to_s
  end
  
  def self.selection_options
    result = []
    self.order('name').to_a.each do |e|
      result << [e.name, e.id]
    end
    result
  end         
  
  
end
