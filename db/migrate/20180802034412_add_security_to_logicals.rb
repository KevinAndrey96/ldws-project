class AddSecurityToLogicals < ActiveRecord::Migration
  def change
    add_column :logicals, :security, :boolean
  end
end
