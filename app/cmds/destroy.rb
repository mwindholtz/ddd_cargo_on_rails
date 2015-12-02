require 'cmds'
module Cmds
  class Destroy < Cmds::GenericBase

    def initialize(klass, object_id)
      @object_id = object_id
      super(klass)
    end

    def call
      object = klass.find(object_id)
      object.destroy
      presenter_klass.new(object)
    end
  
    protected
      attr_reader :object_id
  end
 
end
