# == Schema Information
#
# Table name: the_switches
#
#  id          :integer          not null, primary key
#  switches_id :integer
#  ports_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  numberports :integer
#
# Indexes
#
#  index_the_switches_on_ports_id     (ports_id)
#  index_the_switches_on_switches_id  (switches_id)
#

class TheSwitch < ActiveRecord::Base
  belongs_to :switch
  belongs_to :port
end
