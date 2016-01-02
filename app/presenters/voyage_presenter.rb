class VoyagePresenter          
  include LinkToHelpers

  ATTRS =  [ :home_port ]
  attr_reader *ATTRS
    
  def initialize(voyage=nil)
    @voyage = voyage || Voyage.new
    unless @voyage.new_record?
    end
  end
  
  def target
    @voyage
  end
  
  def location_options 
    Location.selection_options 
  end  
  
  def errors
    @voyage.errors
  end

  def values
    ATTRS.map{|each| self.public_send(each) }
  end

  def home_port
    target.home_port
  end
  
  def available
    target.available?
  end

  def carrier_movements
    target.schedule.carrier_movements
  end

  # Links ..........
        
  def link_to_show
    link_to('Show', target)
  end      
  
  def link_to_edit
    link_to('Edit', edit_voyage_path(target))
  end      
  
  def link_to_destroy
    link_to('Destroy', target, method: :delete, data: { confirm: 'Are you sure?' })
  end      
  
  def link_to_index(label='Index')
    link_to(label, voyages_path)
  end

  private 
    def exhibit(model, context)
      Exhibit.exhibit(model, context)
    end
      
end
