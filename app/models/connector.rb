# == Schema Information
#
# Table name: connectors
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Connector < ActiveRecord::Base
    
end
