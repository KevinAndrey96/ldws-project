class AddSlotsAndPowerToEquipment < ActiveRecord::Migration
  def change
    add_column :equipment, :slots, :integer
    add_column :equipment, :power, :integer
  end
end
