module Cmds
  class Create < Cmds::GenericBase
    def initialize(klass, attrs)
      @attrs = attrs
      super(klass)
    end

    def call
      object = klass.new(attrs)
      object.save
      presenter_klass.new(object)
    end

    protected

      attr_reader :attrs
  end
end
