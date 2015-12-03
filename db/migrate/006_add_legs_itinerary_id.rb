class AddLegsItineraryId < ActiveRecord::Migration
  def change
    add_column :legs, :itinerary_id, :integer,  null: false, default: 0 
  end
end
