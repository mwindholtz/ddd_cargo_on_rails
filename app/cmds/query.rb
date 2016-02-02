module Cmds
  class Query < Cmds::GenericBase
    attr_reader :criteria

    def initialize(klass, criteria)
      @criteria = criteria
      super(klass)
    end

    def call
      list_presenter_klass.new(criteria_query)
    end

    private

      def target_klass
        klass
      end

      def criteria_query
        target_klass.criteria_query(criteria)
      end
  end
end
