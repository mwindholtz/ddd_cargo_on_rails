class ItineraryPresenter
  include PresenterBase

  ATTRS = [].freeze
  attr_reader(*ATTRS)

  def initialize(object = nil)
    @object = object || Itinerary.new
    unless @object.new_record?
    end
  end

  def target
    @object
  end

  def errors
    @object.errors
  end

  def values
    ATTRS.map { |each| public_send(each) }
  end

  delegate :legs, to: :target

  # Links ..........

  def link_to_cargo
    if target.cargo
      view_context.link_to("Cargo(#{target.cargo.id}) ", target.cargo)
    else
      'No Cargo'
    end
  end

  def link_to_show
    view_context.link_to('Show', target)
  end
end
