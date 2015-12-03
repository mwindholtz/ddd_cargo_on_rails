require "delegate"
class LegListPresenter < DelegateClass(Array)
  include LinkToHelpers
    
  def initialize(items)
    super(items.to_a.map{|item| LegPresenter.new(item)} )
  end

  def titles      
    [ "Load Location",
      "Unload Location",
    ]
  end      

  def link_to_index(label='Index')
    link_to(label, legs_path)
  end
  
  def link_to_new
    link_to('New Leg', new_leg_path)
  end

end
