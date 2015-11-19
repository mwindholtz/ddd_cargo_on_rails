require 'cmds'
module Cmds
  class CargoUpdate < Cmds::Base

    def initialize(object_id, attrs)
      @attrs = attrs   
      @object_id = object_id
      super()
    end

    def call
      cargo = Cargo.find(@object_id)
      cargo.update(@attrs)
      CargoPresenter.new(cargo)
    end

  end
 
end
