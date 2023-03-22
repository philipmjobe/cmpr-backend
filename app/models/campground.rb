class Campground < ApplicationRecord
  validates :campground_name, presence: true
end
