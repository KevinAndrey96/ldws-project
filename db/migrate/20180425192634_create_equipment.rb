class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :brand
      t.string :type
      t.string :reference
      t.integer :price
      t.integer :ports

      t.timestamps null: false
    end
  end
end
