module Cmds
  class Find < Cmds::GenericBase
 
    attr_reader :object_id
  
    def initialize(klass, object_id)
      @object_id = object_id           
      super(klass)
    end

    def call
      object = klass.find(object_id)
      presenter_klass.new(object)
    end
  end
end