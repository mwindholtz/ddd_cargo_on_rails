require 'cmds'
module Cmds
  class CargoDestroy < Cmds::Base

    def initialize(object_id)
      @object_id = object_id
      super()
    end

    def call
      cargo = Cargo.find(@object_id)
      cargo.destroy
      CargoPresenter.new(cargo)
    end

  end
 
end
