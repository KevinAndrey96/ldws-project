# == Schema Information
#
# Table name: logicals
#
#  id                 :integer          not null, primary key
#  request_id         :integer
#  host1              :integer
#  host2              :integer
#  host3              :integer
#  host4              :integer
#  redundancy         :boolean
#  scalability        :integer
#  subnets            :integer
#  subnet_description :string
#  scripts            :boolean
#  iptable            :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_logicals_on_request_id  (request_id)
#

class Logical < ActiveRecord::Base
    belongs_to :request
end
