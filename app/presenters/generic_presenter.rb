class GenericPresenter
  def initialize(object = nil)
    @object = object
  end

  def target
    @object
  end

  def errors
    @object.errors
  end

  def values
    []
  end
end
