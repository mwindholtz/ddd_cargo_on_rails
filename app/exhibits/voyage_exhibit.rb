class VoyageExhibit < Exhibit
  def self.applicable_to?(object)
    object.is_a?(Voyage)
  end

  def render_body
    @context.render(text: "#{to_param}: #{exhibit(home_port)}".html_safe)
  end
end
