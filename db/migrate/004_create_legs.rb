class CreateLegs < ActiveRecord::Migration
  def change
    create_table :legs do |t| 
      t.integer  :load_location_id,   null: false
      t.datetime :load_time,          null: false
      t.integer  :unload_location_id, null: false
      t.datetime :unload_time,        null: false
    end 
  end
end
