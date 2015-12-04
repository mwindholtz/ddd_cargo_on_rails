class AddCarrierMovementsFlds < ActiveRecord::Migration
  def change
    add_column :carrier_movements, :depart_location_id,  :integer
    add_column :carrier_movements, :arrival_location_id, :integer
    add_column :carrier_movements, :depart_at,           :datetime
    add_column :carrier_movements, :arrival_at,          :datetime 
  end
end
