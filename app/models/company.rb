# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  nit        :integer
#  mision     :string
#  vision     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_companies_on_user_id  (user_id)
#

class Company < ActiveRecord::Base
    belongs_to :user
    has_one :binnacle
    has_many :request
end
