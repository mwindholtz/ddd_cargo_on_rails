class LocationPresenter    
  include PresenterBase
  
  ATTRS =  [:code, :name]
  attr_reader *ATTRS
  attr_accessor :show_all
  
  def initialize(object=nil)
    @object = object || Location.new
    unless @object.new_record?
      @code =  @object.code
      @name =  @object.name
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
    view_context.link_to('Show', target)
  end      

  def link_to_edit
    view_context.link_to('Edit', view_context.edit_location_path(target))
  end      

  def link_to_destroy
    view_context.link_to('Destroy', target, method: :delete, data: { confirm: 'Are you sure?' })
  end      
  
  def link_to_index(label='Index')
    view_context.link_to(label, view_context.locations_path)
  end
  
end
