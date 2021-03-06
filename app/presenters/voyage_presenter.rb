class VoyagePresenter
  include PresenterBase

  ATTRS = [:home_port].freeze
  attr_reader(*ATTRS)

  def initialize(voyage = nil)
    @voyage = voyage || Voyage.new
    unless @voyage.new_record?
    end
  end

  def target
    @voyage
  end

  def location_options
    Location.selection_options
  end

  def errors
    @voyage.errors
  end

  def values
    ATTRS.map { |each| public_send(each) }
  end

  delegate :home_port, to: :target

  def available
    target.available?
  end

  delegate :why_available, to: :target

  def carrier_movements
    target.schedule.carrier_movements
  end

  # Links ..........

  def link_to_show
    view_context.link_to('Show', target)
  end

  def link_to_edit
    view_context.link_to('Edit', view_context.edit_voyage_path(target))
  end

  def link_to_destroy
    view_context.link_to('Destroy', target, method: :delete, data: { confirm: 'Are you sure?' })
  end

  def link_to_index(label = 'Index')
    view_context.link_to(label, view_context.voyages_path)
  end

  private

    def exhibit(model, context)
      Exhibit.exhibit(model, context)
    end
end
