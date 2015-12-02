class LegPresenter    

  def initialize(object=nil)
    @object = object || Leg.new
  end
  
  def target
    @object
  end
  
  def errors
    @object.errors
  end
  
end
