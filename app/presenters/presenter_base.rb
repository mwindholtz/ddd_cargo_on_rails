module PresenterBase
  
  def set_context(view_context)
    @view_context = view_context
    if @view_context_holder  # used for list presenters
      @view_context_holder.set_context(view_context)
    end
    self
  end
 
  def view_context_holder
    @view_context_holder ||= ViewContextHolder.new(nil)
  end
  
  protected
    def view_context
      @view_context
    end

    def self.append_features(base)
      super
    end

end
