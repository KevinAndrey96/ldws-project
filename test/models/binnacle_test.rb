# == Schema Information
#
# Table name: binnacles
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  company_id  :integer
#  action      :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_binnacles_on_company_id  (company_id)
#  index_binnacles_on_user_id     (user_id)
#

require 'test_helper'

class BinnacleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
