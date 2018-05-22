# == Schema Information
#
# Table name: subnets
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  computers   :integer
#  logical_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_subnets_on_logical_id  (logical_id)
#

class Subnet < ActiveRecord::Base
  belongs_to :logical
end
