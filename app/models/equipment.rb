# == Schema Information
#
# Table name: equipment
#
#  id         :integer          not null, primary key
#  brand      :string
#  etype      :string
#  reference  :string
#  price      :integer
#  ports      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slots      :integer
#  power      :integer
#

class Equipment < ActiveRecord::Base
end
