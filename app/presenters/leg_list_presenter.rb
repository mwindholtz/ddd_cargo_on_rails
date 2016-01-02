require "delegate"
class LegListPresenter < DelegateClass(Array)
  include PresenterBase
    
  def initialize(items)
    super(items.to_a.map{|item| LegPresenter.new(item).set_context(view_context_holder) } )
  end

  def titles      
    [ "Load Location",
      "Unload Location",
    ]
  end      

  def link_to_index(label='Index')
    view_context.link_to(label, view_context.legs_path)
  end
  
  def link_to_new
    view_context.link_to('New Leg', view_context.new_leg_path)
  end

end
