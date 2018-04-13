class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :title
      t.references :company, index: true, foreign_key: true
      t.string :description
      t.string :objective
      t.string :observation
      t.boolean :web
      t.boolean :bd
      t.boolean :aplications
      t.boolean :proxy
      t.boolean :voip
      t.boolean :video_conference
      t.boolean :active_dir
      t.boolean :dhcp
      t.boolean :dns
      t.boolean :ftp
      t.boolean :email
      #t.references :logical, index: true, foreign_key: true
      #t.references :physical, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
