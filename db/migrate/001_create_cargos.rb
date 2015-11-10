class CreateCargos < ActiveRecord::Migration
  def change
    create_table :cargos do |t|
      t.integer   :origin_id,           null: false
      t.integer   :destination_id,      null: false
      t.datetime  :arrival_deadline_on, null: false
      t.timestamps null: false
    end
  end
end
