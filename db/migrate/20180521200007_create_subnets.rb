class CreateSubnets < ActiveRecord::Migration
  def change
    create_table :subnets do |t|
      t.string :name
      t.string :description
      t.integer :computers
      t.references :logical, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
