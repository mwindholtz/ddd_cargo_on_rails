class CarrierMovementExhibit < Exhibit
    
  def self.applicable_to?(object)
    object.is_a?(CarrierMovement) 
  end
  
  def render_body   
    @context.render(text: "<em title='#{self.depart_at}'>#{self.depart_location.name} </em> => <em title='#{self.arrival_at}'>#{self.arrival_location.name}</em>".html_safe ) 
  end 
  
end
