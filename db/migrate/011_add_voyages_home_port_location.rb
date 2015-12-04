class AddVoyagesHomePortLocation < ActiveRecord::Migration
  def change
    add_column :voyages, :home_port_id, :integer 
  end
end
