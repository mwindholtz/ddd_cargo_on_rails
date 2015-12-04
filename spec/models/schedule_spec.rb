require 'rails_helper'

RSpec.describe Schedule, type: :model do
  include_context 'exemplar'
  
  context "create" do
    Given!(:original_count) { Schedule.count }
    When(:result)           { Schedule.create!( ExemplarFactory.schedule_attrs) }
    Then                    { Schedule.count == original_count + 1 }        
  end
end
