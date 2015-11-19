class LocationExhibit < Exhibit
    
  def self.applicable_to?(object)
    object.is_a?(Location)     
  end
  
  def render_body
    @context.render(text: "<em title='#{self.name}'>#{self.code}</em>".html_safe ) 
  end
  
end
