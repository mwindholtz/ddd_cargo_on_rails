module LinkToHelpers
  
  protected
    def self.append_features(base)
      super
      base.include ActionView::Helpers::UrlHelper
      base.include ActionView::Helpers::TagHelper
      base.include ActionView::Helpers
      base.include Rails.application.routes.url_helpers
    end

end
