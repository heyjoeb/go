class CreateTheftReports < ActiveRecord::Migration
  def change
    create_table :theft_reports do |t|
      t.integer :bike_id
      t.integer :status, default: 1
      t.string :bike_name
      t.text :theft_details
      t.string :theft_location
      t.date :theft_date

      t.timestamps null: false
    end
  end
end
