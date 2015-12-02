require 'cmds'

module Cmds
  class GenericBase < Cmds::Base
    attr_reader :klass 
    
    def initialize(klass)
      @klass = klass
      super()
    end

    def presenter_klass
      klass_for("#{klass}Presenter")
    end

    def list_presenter_klass
      klass_for("#{klass}ListPresenter")
    end
    
    private
      def klass_for(klass_name)
        Kernel.const_get(klass_name)
      end   
    
  end
 
end
