class CargoPresenter          
  include LinkToHelpers

  ATTRS =  [:origin,  :destination,  :arrival_deadline_on]
  attr_reader *ATTRS
  
  def initialize(cargo=nil)
    @cargo = cargo || Cargo.new
    unless @cargo.new_record?
      @origin              =  @cargo.origin
      @destination         = @cargo.destination
      @arrival_deadline_on = @cargo.arrival_deadline_on
    end
  end
  
  def target
    @cargo
  end
  
  def location_options 
    Location.selection_options 
  end  
  
  def errors
    @cargo.errors
  end

  def values
    ATTRS.map{|each| self.public_send(each) }
  end

  # Links ..........
        
  def link_to_itinerary                   
    if target.itinerary
      link_to("Itinerary(#{target.itinerary.id}) ", target.itinerary)
    else
      'No Itinerary'
    end
  end      

  def link_to_show
    link_to('Show', target)
  end      

  def link_to_edit
    link_to('Edit', edit_cargo_path(target))
  end      

  def link_to_destroy
    link_to('Destroy', target, method: :delete, data: { confirm: 'Are you sure?' })
  end      
  
  def link_to_index(label='Index')
    link_to(label, cargos_path)
  end
  
end
