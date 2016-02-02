class StringExhibit < Exhibit
  def self.applicable_to?(object)
    object.is_a?(String)
  end

  def render_body
    @context.render(text: "<strong>#{self}</strong>".html_safe)
  end
end
