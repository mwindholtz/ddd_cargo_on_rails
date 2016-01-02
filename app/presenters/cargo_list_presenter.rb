require "delegate"
class CargoListPresenter < DelegateClass(Array)
  include PresenterBase
    
  def initialize(items)
    super(items.to_a.map{|item| CargoPresenter.new(item).set_context(view_context_holder)} )
  end
  
  def titles      
    [ "Origin",
      "Destination",
      "Arrival Deadline",
    ]
  end      

  def link_to_index(label='Index')
    view_context.link_to(label, view_context.cargos_path)
  end
  
  def link_to_new
    view_context.link_to('New Cargo', view_context.new_cargo_path)
  end

end
