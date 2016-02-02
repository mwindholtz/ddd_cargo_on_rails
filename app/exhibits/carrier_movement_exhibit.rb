class CarrierMovementExhibit < Exhibit
  def self.applicable_to?(object)
    object.is_a?(CarrierMovement)
  end

  def render_body
    @context.render(text: "<em title='#{depart_at}'>#{depart_location.name} </em> => <em title='#{arrival_at}'>#{arrival_location.name}</em>".html_safe)
  end
end
