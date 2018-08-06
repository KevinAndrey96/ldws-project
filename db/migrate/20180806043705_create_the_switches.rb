class CreateTheSwitches < ActiveRecord::Migration
  def change
    create_table :the_switches do |t|
      t.belongs_to :switches, index: true
      t.belongs_to :ports, index: true

      t.timestamps null: false
    end
  end
end
