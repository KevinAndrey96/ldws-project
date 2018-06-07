class CreateBinnacles < ActiveRecord::Migration
  def change
    create_table :binnacles do |t|
      t.references :user, index: true, foreign_key: true
      t.references :company, index: true, foreign_key: true
      t.string :action
      t.string :description

      t.timestamps null: false
    end
  end
end
