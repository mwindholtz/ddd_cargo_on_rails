# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def seed_now
  time_now = Time.now
  today    = Date.today
  
  singapore =  Location.find_or_create_by(code: 'SGP999', name: 'Singapore')  
  hong_kong =  Location.find_or_create_by(code: 'HKG999', name: 'Hong Kong')  
  seattle =    Location.find_or_create_by(code: 'SEA999', name: 'Seattle')      
  long_beach = Location.find_or_create_by(code: 'LGB999', name: 'Long Beach')  
  dallas =     Location.find_or_create_by(code: 'DFW999', name: 'Dallas') 

  Leg.find_or_create_by(
    load_location_id:   hong_kong.id,
    load_time:          (time_now + 1.day),
    unload_location_id: long_beach.id,
    unload_time:        (time_now + 10.days), 
    )

  Leg.find_or_create_by(
    load_location_id:   long_beach.id,
    load_time:          (time_now + 11.days),
    unload_location_id: seattle.id,
    unload_time:        (time_now + 14.days), 
    )
 
  Leg.find_or_create_by(
    load_location_id:   seattle.id,
    load_time:          (time_now + 16.days),
    unload_location_id: singapore.id,
    unload_time:        (time_now + 26.days), 
    )

  Leg.find_or_create_by(
    load_location_id:   singapore.id,
    load_time:          (time_now + 16.days),
    unload_location_id: hong_kong.id,
    unload_time:        (time_now + 26.days), 
    )

  Leg.find_or_create_by(
    load_location_id:   seattle.id,
    load_time:          (time_now + 30.days),
    unload_location_id: dallas.id,
    unload_time:        (time_now + 32.days), 
    )

end                 

seed_now
