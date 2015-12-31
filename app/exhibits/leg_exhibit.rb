class LegExhibit < Exhibit
    
  def self.applicable_to?(object)
    object.is_a?(Leg)     
  end
  
  def render_body   
    @context.render(text: "<em title='#{self.load_time}'>#{self.load_location.name} </em> => <em title='#{self.unload_time}'>#{self.unload_location.name}</em>".html_safe ) 
  end
  
end