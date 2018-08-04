# == Schema Information
#
# Table name: requests
#
#  id               :integer          not null, primary key
#  title            :string
#  company_id       :integer
#  description      :string
#  objective        :string
#  observation      :string
#  web              :boolean
#  bd               :boolean
#  aplications      :boolean
#  proxy            :boolean
#  voip             :boolean
#  video_conference :boolean
#  active_dir       :boolean
#  dhcp             :boolean
#  dns              :boolean
#  ftp              :boolean
#  email            :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  ctype            :string
#
# Indexes
#
#  index_requests_on_company_id  (company_id)
#

require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
