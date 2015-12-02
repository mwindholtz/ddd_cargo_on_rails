require 'cmds'
module Cmds
  class Update < Cmds::GenericBase

    def initialize(klass, object_id, attrs)
      @attrs = attrs   
      @object_id = object_id
      super(klass)
    end

    def call
      object = klass.find(object_id)
      object.update(attrs)
      presenter_klass.new(object)
    end

    protected 
      attr_reader :attrs, :object_id
  end
  
end
