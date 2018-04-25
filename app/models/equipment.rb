# == Schema Information
#
# Table name: equipment
#
#  id         :integer          not null, primary key
#  brand      :string
#  type       :string
#  reference  :string
#  price      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Equipment < ActiveRecord::Base
end
