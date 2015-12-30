require "delegate"
class LocationListPresenter < DelegateClass(Array)
  include LinkToHelpers
    
  def initialize(items)
    super(items.to_a.map{|item| LocationPresenter.new(item)} )
  end

  def titles      
    [ "Code",
      "Name",
    ]
  end      

  def link_to_index(label='Index')
    link_to(label, locations_path)
  end
  
  def link_to_new
    link_to('New Location', new_location_path)
  end

end
