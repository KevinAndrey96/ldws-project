class CreateSwitches < ActiveRecord::Migration
  def change
    create_table :switches do |t|
      t.string :name
      t.string :reference
      t.integer :price
      t.integer :nports
      t.integer :port

      t.timestamps null: false
    end
  end
end
