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
        arrival_deadline_on: today + 6, 
      }.merge(extra)
    end 

    def itinerary(extra = {})
      attrs = itinerary_attrs(extra)
      Itinerary.create!(attrs)
    end
    
    def itinerary_attrs(extra = {})
      {     
        start_location_id: singapore.id,
        end_location_id:   long_beach.id,
        arrival_time:      time_now + 5.days,
        layover_minutes:   (60 * 24) + 60,
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

    def leg(origin, load_at, destination, unload_at)
      Leg.find_or_create_by(
        load_location:   origin,
        load_time:       load_at,
        unload_location: destination,
        unload_time:     unload_at, 
        )
    end

    def hong_kong_to_long_beach_leg
      leg(hong_kong, time_now(1), long_beach, time_now(10))
    end
    
    def long_beach_to_hong_kong_leg
      leg(long_beach, time_now(11), hong_kong, time_now(21))
    end
    
    def long_beach_to_seattle_leg
      leg(long_beach, time_now(11), seattle, time_now(14))
    end
    
    def seattle_to_singapore_leg
      leg(seattle, time_now(16), singapore, time_now(26))
    end
    
    def singapore_to_hong_kong_leg
      leg(singapore, time_now(16), hong_kong, time_now(26))
    end
    
    def seattle_to_dallas_leg
      leg(seattle, time_now(30), dallas, time_now(32))  
    end

    def time_now(plus_days=0)
      Time.now + plus_days
    end   
                        
    def today
      Date.today
    end                 
                                                                
  end # class ExemplarFactory
end # if Rails.env.test?