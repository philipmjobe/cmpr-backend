class CreateCampgrounds < ActiveRecord::Migration[7.0]
  def change
    create_table :campgrounds do |t|
      t.decimal :longitude, precision: 10, scale:6
      t.decimal :latitude, precision: 10, scale:6
      t.string :gps_composite_field
      t.string :campground_code
      t.string :campground_name
      t.string :type
      t.string :phone_number
      t.string :dates_open
      t.string :comments
      t.integer :number_of_campsites
      t.string :elevation
      t.string :amenities
      t.string :state
      t.string :nearest_town

      t.timestamps
    end
  end
end
