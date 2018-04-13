class CreatePhysicals < ActiveRecord::Migration
  def change
    create_table :physicals do |t|
      t.references :request, index: true, foreign_key: true
      t.integer :height
      t.integer :width
      t.integer :large
      t.integer :computers
      t.boolean :conference_hall

      t.timestamps null: false
    end
  end
end
