# == Schema Information
#
# Table name: ports
#
#  id         :integer          not null, primary key
#  name       :string
#  speed      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Port < ActiveRecord::Base
     validates :name, uniqueness: true
     has_many :the_switches
     has_many :switches, :through => :the_switches
end
