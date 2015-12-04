class CreateCarrierMovement < ActiveRecord::Migration
  def change
    create_table :carrier_movements do |t|
      t.integer :schedule_id
    end
  end
end
