# == Schema Information
#
# Table name: cables
#
#  id           :integer          not null, primary key
#  name         :string
#  ctype        :string
#  structure    :string
#  connector_id :integer
#  ethernet_id  :integer
#  category_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_cables_on_category_id   (category_id)
#  index_cables_on_connector_id  (connector_id)
#  index_cables_on_ethernet_id   (ethernet_id)
#

require 'test_helper'

class CableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
