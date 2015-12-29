class ItineraryPresenter
  include LinkToHelpers
  ATTRS =  []
  attr_reader *ATTRS
  
  def initialize(object=nil)
    @object = object || Itinerary.new
    unless @object.new_record?
    end
  end
  
  def target
    @object
  end
  
  def errors
    @object.errors
  end

  def values
    ATTRS.map{|each| self.public_send(each) }
  end
 
 
  # Links ..........
        
  def link_to_show
    link_to('Show', target)
  end      

  # def link_to_edit
  #   link_to('Edit', edit_location_path(target))
  # end      

  def link_to_destroy
    link_to('Destroy', target, method: :delete, data: { confirm: 'Are you sure?' })
  end      
  
  def link_to_index(label='Index')
    link_to(label, locations_path)
  end
  
end
