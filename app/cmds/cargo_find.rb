require 'cmds'
module Cmds
  class CargoFind < Cmds::Base
 
    attr_reader :cargo_id
  
    def initialize(cargo_id)
      @cargo_id = cargo_id             
      super()
    end

    def call
      cargo = Cargo.find(cargo_id)
      CargoPresenter.new(cargo) 
    end
  end
end