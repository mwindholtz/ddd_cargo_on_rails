if Rails.env.test? || Rails.env.development?
  module ExemplarFactory
    
    module_function
    
    def cargo(extra={})
      attrs = cargo_attrs(extra)   
      Cargo.create!( attrs )
    end

    def cargo_attrs(extra ={})
      {
        origin_id:        singapore.id,
        destination_id:   long_beach.id,
        arrival_deadline: today + 6, 
        weight_kg:        10_000,
      }.merge(extra)
    end 

    def itinerary(extra = {})
      attrs = itinerary_attrs(extra)
      Itinerary.create!(attrs)
    end
    
    def itinerary_attrs(extra = {})
      {     
        start_location:  'ABC',
        end_location:    'XYZ',
        arrival_time:    time_now + 5.days,
        layover_minutes: (60 * 24) + 60,
      }.merge(extra)
    end
    
    def singapore
      Location.find_or_create_by(code: 'SGP', name: 'Singapore')  
    end

    def hong_kong
      Location.find_or_create_by(code: 'HKG', name: 'Hong Kong')  
    end

    def seattle
      Location.find_or_create_by(code: 'SEA', name: 'Seattle')      
    end

    def long_beach
      Location.find_or_create_by(code: 'LGB', name: 'Long Beach')  
    end

    def dallas
      Location.find_or_create_by(code: 'DFW', name: 'Dallas') 
    end
    
    def time_now
      Time.now
    end                 
                        
    def today
      Date.today
    end                 
                                                                
  end # class ExemplarFactory
end # if Rails.env.test?