class CreateCables < ActiveRecord::Migration
  def change
    create_table :cables do |t|
      t.string :name
      t.string :ctype
      t.string :structure
      t.references :connector, index: true, foreign_key: true
      t.references :ethernet, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
