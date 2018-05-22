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

require 'test_helper'

class SubnetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
