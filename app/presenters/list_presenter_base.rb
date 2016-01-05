module ListPresenterBase
  
  def set_context(view_context)
    @view_context = view_context
    view_context_holder.set_context(view_context)
    self
  end
 
  def view_context_holder
    @view_context_holder ||= ViewContextHolder.new(nil)
  end
  
  protected
    def view_context
      @view_context
    end


end
