class RenameLongitudeToLon < ActiveRecord::Migration[7.0]
  def change
    rename_column :campgrounds, :longitude, :lon
  end
end
