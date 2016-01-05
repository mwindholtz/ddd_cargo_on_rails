# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

def seed_now
  time_now = Time.now
  today    = Date.today
  
  singapore =  Location.find_or_create_by(code: 'SGP999', name: 'Singapore')  
  hong_kong =  Location.find_or_create_by(code: 'HKG999', name: 'Hong Kong')  
  seattle =    Location.find_or_create_by(code: 'SEA999', name: 'Seattle')      
  long_beach = Location.find_or_create_by(code: 'LGB999', name: 'Long Beach')  
  dallas =     Location.find_or_create_by(code: 'DFW999', name: 'Dallas') 

  builder = VoyageBuilder.new(Voyage.create!(home_port_id: hong_kong.id))   
  builder.movement_to( long_beach) 
  builder.movement_to( hong_kong)  

  Cargo.create!(origin_id:           hong_kong.id,             
                destination_id:      long_beach.id,
                arrival_deadline_on: today + 6) 

  Cargo.create!(origin_id:           seattle.id,    
                destination_id:      long_beach.id,
                arrival_deadline_on: today + 9) 

  
end   

seed_now
