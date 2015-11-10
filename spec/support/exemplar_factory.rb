if Rails.env.test? || Rails.env.development?
  module ExemplarFactory
    
    module_function
    
    def cargo(extra={})
      attrs = cargo_attrs(extra)   
      Cargo.create!( attrs )
    end

    def cargo_attrs(extra ={})
      {
        origin_id:        1,
        destination_id:   2,
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
    
    def today
      Date.today
    end                 
    
    def time_now
      Time.now
    end                 
    
  end # class ExemplarFactory
end # if Rails.env.test?