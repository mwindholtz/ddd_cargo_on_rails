class ActiveRecord::Base
  def display_errors(sep = ', ')  
    self.errors.full_messages.join(sep)
  end
  
  def self.criteria_query(criteria)
    criteria.send_to(self).all
  end

  def self.criteria_count(criteria)
    criteria.add(:count)      
    criteria.send_to(self)
  end

  def self.criteria_exists?(criteria)
    criteria.add(:exists?)   
    criteria.send_to(self)
  end
  
end

