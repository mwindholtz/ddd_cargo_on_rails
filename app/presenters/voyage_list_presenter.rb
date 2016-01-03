require "delegate"
class VoyageListPresenter < DelegateClass(Array)
  include ListPresenterBase
    
  def initialize(items)
    super(items.to_a.map{|item| VoyagePresenter.new(item).set_context(view_context_holder) } )
  end

  def titles      
    [ "HomePort",
    ]
  end      

  def link_to_index(label='Index')
    view_context.link_to(label, view_context.voyages_path)
  end
  
  def link_to_new
    view_context.link_to('New Voyage', view_context.new_voyage_path)
  end

end
