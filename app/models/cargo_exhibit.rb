class CargoExhibit < Exhibit
    
  def self.applicable_to?(object)
    object.is_a?(Cargo)     
  end
  
  def render_body
    @context.render(text: "#{self.describe}".html_safe ) 
  end
  
end
