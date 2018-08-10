class CreateEthernets < ActiveRecord::Migration
  def change
    create_table :ethernets do |t|
      t.string :name
      t.integer :speed
      t.integer :distance

      t.timestamps null: false
    end
  end
end
