class CargoExhibit < Exhibit
  def self.applicable_to?(object)
    object.is_a?(Cargo)
  end

  def render_body
    @context.render(text: describe.to_s.html_safe)
  end
end
