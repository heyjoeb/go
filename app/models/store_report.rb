# == Schema Information
#
# Table name: store_reports
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  status            :integer          default(1)
#  store_name        :string
#  store_location    :string
#  store_details     :text
#  store_report_date :date
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class StoreReport < ActiveRecord::Base
  belongs_to :user
  enum status: { verificado: 0, pendiente: 1 }
  validates :store_name, :store_location, :store_details, presence: true
end
