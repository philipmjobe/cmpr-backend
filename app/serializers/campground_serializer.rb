class CampgroundSerializer < ActiveModel::Serializer
  attributes :id, :lng, :lat, :campground_name, :campground_name, :phone_number, :dates_open, :number_of_campsites, :amenities, :state
end
