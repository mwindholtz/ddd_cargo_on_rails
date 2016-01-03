module PresenterBase
  
  def set_context(view_context)
    @view_context = view_context
    self
  end
 
  
  protected
    def view_context
      @view_context
    end

    def self.append_features(base)
      super
    end

end
