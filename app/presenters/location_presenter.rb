class LocationPresenter    
  include LinkToHelpers
  
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
    link_to('Show', target)
  end      

  def link_to_edit
    link_to('Edit', edit_location_path(target))
  end      

  def link_to_destroy
    link_to('Destroy', target, method: :delete, data: { confirm: 'Are you sure?' })
  end      
  
  def link_to_index(label='Index')
    link_to(label, locations_path)
  end
  
end
