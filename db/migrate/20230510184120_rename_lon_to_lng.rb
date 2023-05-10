class RenameLonToLng < ActiveRecord::Migration[7.0]
  def change
    rename_column :campgrounds, :lon, :lng
  end
end
