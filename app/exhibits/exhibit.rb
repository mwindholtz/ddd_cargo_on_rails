# Excerpt From: Avdi Grimm. “Objects on Rails.” iBooks.  p67 ff
class Exhibit < SimpleDelegator
  def self.exhibits
    [
      TimeExhibit,
      LocationExhibit,
      VoyageExhibit,
      StringExhibit,
      CargoExhibit,
      CarrierMovementExhibit,
      ItineraryExhibit,
      LegExhibit
    ]
  end

  def initialize(model, context)
    @context = context
    super(model)
  end

  def to_model
    __getobj__
  end

  delegate :class, to: :__getobj__

  def self.applicable_to?(_object)
    false
  end

  # used for rendering nested objects
  def exhibit(model)
    Exhibit.exhibit(model, @context)
  end

  # ClassMethods

  def self.exhibit(object, context)
    exhibits.inject(object) do |obj, exhibit|
      exhibit.exhibit_if_applicable(obj, context)
    end
  end

  def self.exhibit_if_applicable(object, context)
    if applicable_to?(object)
      new(object, context).render_body
    else
      object
    end
  end
end
