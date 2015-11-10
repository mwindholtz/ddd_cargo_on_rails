class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :code,  null: false   
      t.string :name,  null: false   
    end
  end
end
