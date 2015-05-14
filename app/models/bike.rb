# == Schema Information
#
# Table name: bikes
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  bike_name    :string
#  bike_brand   :string
#  bike_model   :string
#  bike_color   :string
#  bike_serial  :string
#  bike_details :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Bike < ActiveRecord::Base
  belongs_to :user
  has_many :theft_reports, dependent: :destroy 
  validates :bike_name, :bike_brand, :bike_color, :bike_serial, presence: true
end
