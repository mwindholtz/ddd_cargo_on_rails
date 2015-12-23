class CreateVoyage < ActiveRecord::Migration
  def change
    create_table :voyages do |t| 
      t.integer :schedule_id
    end
  end
end
