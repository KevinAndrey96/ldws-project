# == Schema Information
#
# Table name: ethernets
#
#  id         :integer          not null, primary key
#  name       :string
#  speed      :integer
#  distance   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ethernet < ActiveRecord::Base
    
end
