module Cmds
  class GenericBase < Cmds::Base
    attr_reader :klass

    def initialize(klass)
      @klass = klass
      super()
    end

    def presenter_klass
      presenter_klass_for(klass)
    end

    def list_presenter_klass
      presenter_klass_for("#{klass}List")
    end

    private

      def presenter_klass_for(klass_name)
        presenter_name = "#{klass_name}Presenter"
        Module.const_get(presenter_name)
      rescue NameError
        GenericPresenter
      end
  end
end
