module ApplicationHelper
  # Excerpt From:  “Objects on Rails.” by Avdi Grimm.  p67 ff
  def exhibit(model, context)
    Exhibit.exhibit(model, context)
  end
end
