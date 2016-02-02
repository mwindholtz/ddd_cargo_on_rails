# The Problem is that in a list presenter we must create the single_presenters before we have the view_context
# The Solution is that we create this object to act like the view_context until we can get one later.
#
class ViewContextHolder < SimpleDelegator
  def initialize(view_context_or_nil)
    super(view_context_or_nil)
  end

  def set_context(view_context)
    __setobj__(view_context)
  end
end
