class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.integer :nit
      t.string :mision
      t.string :vision

      t.timestamps null: false
    end
  end
end
