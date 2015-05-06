class CreateStoreReports < ActiveRecord::Migration
  def change
    create_table :store_reports do |t|
      t.integer :user_id
      t.integer :status, default: 1
      t.string :store_name
      t.string :store_location
      t.text :store_details
      t.date :store_report_date

      t.timestamps null: false
    end
  end
end
