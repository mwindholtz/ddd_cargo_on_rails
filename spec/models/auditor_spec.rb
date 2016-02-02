require 'rails_helper'

RSpec.describe Auditor, type: :model do
  Given(:auditor) { Auditor.new }

  context '_add' do
    When(:result) { auditor.add(self, 'message') }
    Then { !result }
    And  { auditor.explain == 'message' }
  end

  context '_add two' do
    Given { auditor.add(self, 'message1') }
    When  { auditor.add(self, 'message2') }
    Then  { auditor.explain == 'message1, message2' }
  end

  context 'break on each object' do
    Given(:object)  { 'object' }
    Given { auditor.add(self,   'message1') }
    When  { auditor.add(object, 'message2') }
    Then  { auditor.explain('<br>') == 'message1<br>message2' }
  end

  context 'NullAuditor' do
    Given(:auditor) { Auditor::Null.new }

    context '_add' do
      When { auditor.add(self, 'message') }
      Then { auditor.explain == Auditor::Null::MESSAGE }
    end

    context '_add' do
      When(:result) { auditor.add(self, 'message') }
      Then { !result }
      And  { auditor.explain == Auditor::Null::MESSAGE }
    end
  end
end
