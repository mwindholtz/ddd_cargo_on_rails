if Rails.env.test? || Rails.env.development?
  module ExemplarFactory
    
    module_function
    
    def cargo(extra={})
      attrs = cargo_attrs(extra)   
      participation.create_evaluation!( attrs )
    end

    def cargo_attrs(extra ={})
      {
        origin_id:        1,
        destination_id:   2,
        arrival_deadline: today, 
        weight_kg:        10_000,
      }.merge(extra)
    end 
    
    def today
      Date.today
    end                 
    
  end # class ExemplarFactory
end # if Rails.env.test?