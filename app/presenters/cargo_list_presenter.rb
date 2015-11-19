require "delegate"
class CargoListPresenter < DelegateClass(Array)
  include LinkToHelpers
    
  def initialize(items)
    super(items.to_a.map{|item| CargoPresenter.new(item)} )
  end

  def titles      
    [ "Origin",
      "Destination",
      "Arrival Deadline",
    ]
  end      

  def link_to_index(label='Index')
    link_to(label, cargos_path)
  end
  
  def link_to_new
    link_to('New Cargo', new_cargo_path)
  end

end
