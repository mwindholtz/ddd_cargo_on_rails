class VoyageExhibit < Exhibit
    
  def self.applicable_to?(object)
    object.is_a?(Voyage)     
  end
  
  def render_body   
    @context.render(text: "#{self.to_param}: #{exhibit(self.home_port)}".html_safe ) 
  end
  
end
