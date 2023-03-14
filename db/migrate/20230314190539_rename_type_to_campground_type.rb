class RenameTypeToCampgroundType < ActiveRecord::Migration[7.0]
  def change
    rename_column :campgrounds, :type, :campground_type
  end
end
