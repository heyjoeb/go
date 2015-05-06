class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.integer :user_id
      t.string :bike_name
      t.string :bike_brand
      t.string :bike_model
      t.string :bike_color
      t.string :bike_serial
      t.text :bike_details

      t.timestamps null: false
    end
  end
end
