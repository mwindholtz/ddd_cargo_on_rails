class ReverseVoyageScheduleAssociation < ActiveRecord::Migration
  def up
    add_column :schedules, :voyage_id, :integer
    remove_column :voyages, :schedule_id
  end

  def down
    add_column :voyages, :schedule_id, :integer
    remove_column :schedules, :voyage_id
  end
end
