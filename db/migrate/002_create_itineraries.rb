class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.integer   :start_location_id,  null: false
      t.integer   :end_location_id,    null: false
      t.datetime  :arrival_time,       null: false
      t.integer   :layover_minutes,    null: false
      t.timestamps null: false
    end
  end
end
