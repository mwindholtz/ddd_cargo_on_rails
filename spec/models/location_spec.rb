require 'rails_helper'

RSpec.describe Location, type: :model do
  context 'create' do
    Given!(:original_count) { Location.count }
    When(:result)           { Location.create(code: 'CVG222', name: 'Cincinnati') }
    Then                    { Location.count == original_count + 1 }
    Then                    { result.code.instance_of?(UnLocode) }
    Then                    { result.code.to_s  == 'CVG222' }
    Then                    { result.code.value == 'CVG222' }
  end
end
