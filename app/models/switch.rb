# == Schema Information
#
# Table name: switches
#
#  id         :integer          not null, primary key
#  name       :string
#  reference  :string
#  price      :integer
#  nports     :integer
#  port       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Switch < ActiveRecord::Base
    has_many :switch_ports
    has_many :ports, :through => :switch_ports
end
