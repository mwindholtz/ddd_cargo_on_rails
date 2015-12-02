if Rails.env.test? || Rails.env.development?
  module ExemplarFactory
    
    module_function
    
    def cargo(extra={})
      attrs = cargo_attrs(extra)                  
      Cmds::Create.new(Cargo, attrs).call.target
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
      Cmds::Create.new(Itinerary, attrs).call.target
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
      location('SGP', 'Singapore')
    end                   
                          
    def hong_kong         
      location('HKG', 'Hong Kong')  
    end                   
                          
    def seattle           
      location('SEA', 'Seattle')      
    end                   
                          
    def long_beach        
      location('LGB', 'Long Beach') 
    end

    def dallas
      location('DFW', 'Dallas') 
    end

    def leg(origin, load_at, destination, unload_at)
      attrs = {
        load_location:   origin,
        load_time:       load_at,
        unload_location: destination,
        unload_time:     unload_at }
      Cmds::FindOrCreate.new(Leg, attrs).call.target
    end

    def location(code, name)                        
      attrs = { code: code, name: name }
      Cmds::FindOrCreate.new(Location, attrs  ).call.target
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