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

require 'test_helper'

class TheftReportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
