require "delegate"
class VoyageListPresenter < DelegateClass(Array)
  include LinkToHelpers
    
  def initialize(items)
    super(items.to_a.map{|item| VoyagePresenter.new(item)} )
  end

  def titles      
    [ "HomePort",
    ]
  end      

  def link_to_index(label='Index')
    link_to(label, voyages_path)
  end
  
  def link_to_new
    link_to('New Voyage', new_voyage_path)
  end

end
