class CargoPresenter
  include PresenterBase

  ATTRS = [:origin, :destination, :arrival_deadline_on].freeze
  attr_reader(*ATTRS)

  def initialize(cargo = nil)
    @cargo = cargo || Cargo.new
    unless @cargo.new_record?
      @origin              = @cargo.origin
      @destination         = @cargo.destination
      @arrival_deadline_on = @cargo.arrival_deadline_on
    end
  end

  def target
    @cargo
  end

  def location_options
    Location.selection_options
  end

  def errors
    @cargo.errors
  end

  def values
    ATTRS.map { |each| public_send(each) }
  end

  # Links ..........

  def link_to_itinerary
    if target.itinerary
      view_context.link_to("Itinerary(#{target.itinerary.id}) ", target.itinerary)
    else
      'No Itinerary'
    end
  end

  def link_to_show
    view_context.link_to('Show', target)
  end

  def link_to_edit
    view_context.link_to('Edit', view_context.edit_cargo_path(target))
  end

  def link_to_destroy
    view_context.link_to('Destroy', target, method: :delete, data: { confirm: 'Are you sure?' })
  end

  def link_to_index(label = 'Index')
    view_context.link_to(label, view_context.cargos_path)
  end
end
