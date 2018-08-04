class AddCtypeToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :ctype, :string
  end
end
