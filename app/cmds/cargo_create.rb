require 'cmds'
module Cmds
  class CargoCreate < Cmds::Base

    def initialize(attrs)
      @attrs = attrs
      super()
    end

    def call
      cargo = Cargo.new(@attrs)
      cargo.save
      CargoPresenter.new(cargo)
    end

  end
 
end
