# == Schema Information
#
# Table name: buildings
#
#  id         :integer          not null, primary key
#  name       :string
#  distance   :integer
#  request_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_buildings_on_request_id  (request_id)
#

class Building < ActiveRecord::Base
  belongs_to :request
  has_many :physical
end
