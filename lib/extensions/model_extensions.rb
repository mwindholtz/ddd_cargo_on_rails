class ActiveRecord::Base
  def display_errors(sep = ', ')  
    self.errors.full_messages.join(sep)
  end
end
