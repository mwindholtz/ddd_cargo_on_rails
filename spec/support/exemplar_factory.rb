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

    def hong_kong_to_long_beach_leg
      Leg.find_or_create_by(
        load_location_id:   hong_kong.id,
        load_time:          (time_now + 1.day),
        unload_location_id: long_beach.id,
        unload_time:        (time_now + 10.days), 
        )
    end
    
    def long_beach_to_hong_kong_leg
      Leg.find_or_create_by(
        load_location_id:     long_beach.id,
        load_time:            (time_now + 11.days), 
        unload_location_id:   hong_kong.id,
        unload_time:          (time_now + 21.day),
        )
    end
    
    def long_beach_to_seattle_leg
      Leg.find_or_create_by(
        load_location_id:   long_beach.id,
        load_time:          (time_now + 11.days),
        unload_location_id: seattle.id,
        unload_time:        (time_now + 14.days), 
        )
    end
    
    def seattle_to_singapore_leg
      Leg.find_or_create_by(
        load_location_id:   seattle.id,
        load_time:          (time_now + 16.days),
        unload_location_id: singapore.id,
        unload_time:        (time_now + 26.days), 
        )
    end
    
    def singapore_to_hong_kong_leg
      Leg.find_or_create_by(
        load_location_id:   singapore.id,
        load_time:          (time_now + 16.days),
        unload_location_id: hong_kong.id,
        unload_time:        (time_now + 26.days), 
        )
    end
    
    def seattle_to_denver_leg
      Leg.find_or_create_by(
        load_location_id:   seattle.id,
        load_time:          (time_now + 30.days),
        unload_location_id: dallas.id,
        unload_time:        (time_now + 32.days), 
        )
    end

    def time_now
      Time.now
    end   
                        
    def today
      Date.today
    end                 
                                                                
  end # class ExemplarFactory
end # if Rails.env.test?