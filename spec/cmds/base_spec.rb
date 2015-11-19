require 'rails_helper'

RSpec.describe Cmds::Base, type: :model do

  Given(:base)       { Cmds::Base.new } 

  When(:result) { base.call }
  Then          { result == Failure(NotImplementedError, 'Method #call should be implemented in the child class' ) }

end
