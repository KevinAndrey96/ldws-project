class CreateConnectors < ActiveRecord::Migration
  def change
    create_table :connectors do |t|
      t.string :name
      t.integer :price

      t.timestamps null: false
    end
  end
end
