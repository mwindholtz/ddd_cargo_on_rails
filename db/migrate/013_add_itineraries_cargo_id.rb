class AddItinerariesCargoId < ActiveRecord::Migration
  def change
    add_column :itineraries, :cargo_id, :integer
  end
end

