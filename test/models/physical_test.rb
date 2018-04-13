# == Schema Information
#
# Table name: physicals
#
#  id              :integer          not null, primary key
#  request_id      :integer
#  height          :integer
#  width           :integer
#  large           :integer
#  computers       :integer
#  conference_hall :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_physicals_on_request_id  (request_id)
#

require 'test_helper'

class PhysicalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
