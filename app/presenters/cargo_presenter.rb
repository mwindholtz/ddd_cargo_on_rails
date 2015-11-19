class CargoPresenter      
  ATTRS =  [:origin_code,  :destination_code,  :arrival_deadline_on]
  attr_reader *ATTRS
  
  def initialize(cargo=nil)
    @cargo = cargo || Cargo.new
    unless @cargo.new_record?
      @origin_code =  @cargo.origin.code 
      @destination_code = @cargo.destination.code
      @arrival_deadline_on = @cargo.arrival_deadline_on
    end
  end

  def target
    @cargo
  end
  
  def errors
    @cargo.errors
  end

  def values
    ATTRS.map{|each| self.public_send(each) }
  end
      
      
end