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
        result = criteria.send_to(target_klass).all
      end

      def criteria_count
        criteria.add(:count)      
        criteria.send_to(target_klass)
      end

      def criteria_exist
        criteria.add(:exists?)      
        criteria.send_to(target_klass)
      end

  end
 
end
