class CreateLogicals < ActiveRecord::Migration
  def change
    create_table :logicals do |t|
      t.references :request, index: true, foreign_key: true
      t.integer :host1
      t.integer :host2
      t.integer :host3
      t.integer :host4
      t.boolean :redundancy
      t.integer :scalability

      t.timestamps null: false
    end
  end
end
