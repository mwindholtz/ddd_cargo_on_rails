class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string   :start_location,  null: false
      t.string   :end_location,    null: false
      t.datetime :arrival_time,    null: false
      t.integer  :layover_minutes, null: false
      t.timestamps null: false
    end
  end
end
