# == Schema Information
#
# Table name: theft_reports
#
#  id             :integer          not null, primary key
#  bike_id        :integer
#  status         :integer          default(1)
#  bike_name      :string
#  theft_details  :text
#  theft_location :string
#  theft_date     :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class TheftReport < ActiveRecord::Base
  belongs_to :bike
  enum status: { cerrado: 0, abierto: 1 }
  validates :theft_details, :theft_location, :theft_date, presence: true
end
