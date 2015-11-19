module Cmds
  class Base

    def call
      fail(NotImplementedError, 'Method #call should be implemented in the child class' )
    end

  end # Base
end
