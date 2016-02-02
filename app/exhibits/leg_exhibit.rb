class LegExhibit < Exhibit
  def self.applicable_to?(object)
    object.is_a?(Leg)
  end

  def render_body
    @context.render(text: "<em title='#{load_time}'>#{load_location.name} </em> => <em title='#{unload_time}'>#{unload_location.name}</em>".html_safe)
  end
end
