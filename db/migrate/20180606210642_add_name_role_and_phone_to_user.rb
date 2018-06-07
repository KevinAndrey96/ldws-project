class AddNameRoleAndPhoneToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :role, :string, default: "User"
    add_column :users, :phone, :string
  end
end
