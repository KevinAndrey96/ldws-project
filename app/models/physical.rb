# == Schema Information
#
# Table name: physicals
#
#  id              :integer          not null, primary key
#  request_id      :integer
#  building_id     :integer
#  height          :integer
#  width           :integer
#  large           :integer
#  computers       :integer
#  printers        :integer
#  conference_hall :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_physicals_on_building_id  (building_id)
#  index_physicals_on_request_id   (request_id)
#

class Physical < ActiveRecord::Base
  belongs_to :request
  belongs_to :building
end
