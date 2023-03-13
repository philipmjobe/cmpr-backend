class RenameLatitudeToLat < ActiveRecord::Migration[7.0]
  def change
    rename_column :campgrounds, :latitude, :lat
  end
end
