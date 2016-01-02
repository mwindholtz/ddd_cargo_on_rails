class ItineraryExhibit < Exhibit
    
  def self.applicable_to?(object)
    object.is_a?(Itinerary)     
  end
  
  def render_body   
    @context.render(text: "Itinerary #{self.to_param}".html_safe ) 
  end
  
end
