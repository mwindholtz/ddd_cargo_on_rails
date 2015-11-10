require 'rails_helper'

RSpec.describe Cmds::Base, type: :model do

  Given(:controller) { double("controller", call: nil) } 
  Given(:base)       { Cmds::Base.new(controller) } 

  When(:result) { base.call }
  Then          { result == Failure(NotImplementedError, 'Method #call should be implemented in the child class' ) }

end
