require 'cmds'
module Cmds
  class CargoQuery < Cmds::Base

    def initialize
      super
    end

    def call
      CargoListPresenter.new(Cargo.all)
    end

  end
 
end
