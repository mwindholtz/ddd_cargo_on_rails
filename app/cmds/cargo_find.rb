require 'cmds'
module Cmds
  class CargoFind < Cmds::Base
 
    attr_reader :cargo_id
  
    def initialize(cargo_id)
      @cargo_id = cargo_id             
      super()
    end

    def call
      cargo = Cargo.find_by_id(cargo_id)
      if cargo
        Result.ok.add(cargo: cargo) 
      else
        Result.status(:not_found).add(cargo_id: cargo_id)     
      end 
    end
  end
end