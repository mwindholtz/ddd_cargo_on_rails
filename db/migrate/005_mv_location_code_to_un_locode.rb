class MvLocationCodeToUnLocode < ActiveRecord::Migration
  def change
    rename_column :locations, :code, :un_locode
  end
end
