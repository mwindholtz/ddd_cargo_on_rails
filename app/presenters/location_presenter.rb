class LocationPresenter    

  def initialize(object=nil)
    @object = object || Location.new
  end
  
  def target
    @object
  end
  
  def errors
    @object.errors
  end
  
end
