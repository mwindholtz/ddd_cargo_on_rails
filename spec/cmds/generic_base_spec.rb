require 'rails_helper'

RSpec.describe Cmds::GenericBase, type: :model do
  context '_presenter_klass, existing LocationPresenter' do
    Given(:base)  { Cmds::GenericBase.new(Location) }
    When(:result) { base.presenter_klass }
    Then          { result == LocationPresenter }
  end

  context '_presenter_klass, no existing Presenter' do
    Given(:base)  { Cmds::GenericBase.new(Schedule) }
    When(:result) { base.presenter_klass }
    Then          { result == GenericPresenter }
  end
end
