module PresenterBase
  
  def set_context(view_context)
    @view_context = view_context
    self
  end
 
  
  protected
    def view_context
      @view_context
    end


end
