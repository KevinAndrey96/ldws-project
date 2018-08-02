class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.integer :distance
      t.references :request, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
