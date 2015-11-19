require 'cmds'
module Cmds
  class CargoQuery < Cmds::Base
    attr_reader :criteria    

    def initialize(criteria)
      @criteria = criteria
      super()
    end

    def call
      CargoListPresenter.new(criteria_query)
    end
    
    private            
    
      def target_klass
        Cargo
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
