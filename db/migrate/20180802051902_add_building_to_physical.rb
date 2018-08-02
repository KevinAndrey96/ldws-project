class AddBuildingToPhysical < ActiveRecord::Migration
  def change
    add_reference :physicals, :building, index: true, foreign_key: true
  end
end
