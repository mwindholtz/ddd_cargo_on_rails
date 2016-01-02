class LegPresenter    
  include PresenterBase
  
  ATTRS =  [:load_location, :unload_location]
  attr_reader *ATTRS
  attr_accessor :show_all
  
  def initialize(object=nil)
    @object = object || Leg.new
    unless @object.new_record?
      @load_location   =  @object.load_location
      @unload_location =  @object.unload_location
    end
  end
  
  def target
    @object
  end
  
  def location_options 
    Location.selection_options 
  end  
  
  def errors
    @object.errors
  end

  def values
    ATTRS.map{|each| self.public_send(each) }
  end 
 
  # Links ..........
        
  def link_to_show
    view_context.link_to('Show', target)
  end      

  def link_to_edit
    view_context.link_to('Edit', view_context.edit_leg_path(target))
  end      

  def link_to_destroy
    view_context.link_to('Destroy', target, method: :delete, data: { confirm: 'Are you sure?' })
  end      
  
  def link_to_index(label='Index')
    view_context.link_to(label, view_context.legs_path)
  end  
  
end
