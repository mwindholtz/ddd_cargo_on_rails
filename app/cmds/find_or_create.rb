require 'cmds'

module Cmds
  class FindOrCreate < Cmds::GenericBase

    def initialize(klass, attrs)
      @attrs = attrs
      super(klass)
    end

    def call
      object = klass.find_or_create_by(attrs)
      presenter_klass.new(object)
    end

    protected 
      attr_reader :attrs

  end
 
end
