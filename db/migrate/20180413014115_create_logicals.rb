class CreateLogicals < ActiveRecord::Migration
  def change
    create_table :logicals do |t|
      t.references :request, index: true, foreign_key: true
      t.boolean :redundancy
      t.boolean :scalability
      t.integer :subnets
      t.string :subnet_description
      t.boolean :scripts
      t.boolean :iptable

      t.timestamps null: false
    end
  end
end
