require "delegate"
class LocationListPresenter < DelegateClass(Array)
  include ListPresenterBase
    
  def initialize(items)
    super(items.to_a.map{|item| LocationPresenter.new(item).set_context(view_context_holder) } )
  end

  def titles      
    [ 
      "Name",      
      "Code",
    ]
  end      

  def link_to_index(label='Index')
    view_context.link_to(label, view_context.locations_path)
  end
  
  def link_to_new
    view_context.link_to('New Location', view_context.new_location_path)
  end

end
