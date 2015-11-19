require "delegate"
class CargoListPresenter < DelegateClass(Array)
  
  def initialize(items)
    super(items.map{|item| CargoPresenter.new(item)} )
  end

  def titles      
    [ "Origin",
      "Destination",
      "Arrival Deadline",
    ]
  end      

end
