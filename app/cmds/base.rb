module Cmds
  class Base
    attr_reader :controller

    def initialize(controller)
      @controller = controller
    end

    def call
      fail(NotImplementedError, 'Method #call should be implemented in the child class' )
    end

  end # Base
end
