class AddNumberPortsToTheSwitches < ActiveRecord::Migration
  def change
    add_column :the_switches, :numberports, :integer
  end
end
