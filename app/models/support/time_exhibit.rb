class TimeExhibit < Exhibit
  Time::DATE_FORMATS[:info]  = "%Y-%m-%d %H:%M %Z" 
  Time::DATE_FORMATS[:short] = "%Y-%m-%d" 
  Time::DATE_FORMATS[:dow] = "%a"  
      
  def self.applicable_to?(object)
    object.is_a?(Time)  || object.is_a?(ActiveSupport::TimeWithZone)
  end
  
  def render_body
    @context.render(text: "<span title='#{self.to_s(:info)}'> #{self.to_s(:short)} #{self.to_s(:dow)}</span>".html_safe )
  end
  
end
