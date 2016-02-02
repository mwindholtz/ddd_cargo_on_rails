class LocationExhibit < Exhibit
  def self.applicable_to?(object)
    object.is_a?(Location)
  end

  def render_body
    if @context.prez.try(:show_all)
      @context.render(text: "<em>#{code}</em> #{name}".html_safe)
    else
      @context.render(text: "<em title='#{name}'>#{code}</em>".html_safe)
    end
  end
end
