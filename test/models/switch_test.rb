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

require 'test_helper'

class SwitchTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
