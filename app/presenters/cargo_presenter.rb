class CargoPresenter
  
  def initialize(cargo=nil)
    @cargo = cargo || Cargo.new
  end

  def target
    @cargo
  end
  
  def errors
    @cargo.errors
  end
      
end