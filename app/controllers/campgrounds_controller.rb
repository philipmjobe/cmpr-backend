class CampgroundsController < ApplicationController

  def index
    campgrounds = Campground.all
    render json: campgrounds
  end 

  def create 
    campground = Campground.new(
      lon: params[:lon],
      lat: params[:lat],
      gps_composite_field: params[:gps_composite_field],
      campground_code: params[:campground_code],
      campground_name: params[:campground_name],
      campground_type: params[:campground_type],
      phone_number: params[:phone_number],
      dates_open: params[:dates_open],
      comments: params[:comments],
      number_of_campsites: params[:number_of_campsites],
      elevation: params[:elevation],
      amenities: params[:amenities],
      state: params[:state],
      nearest_town: params[:nearest_town]
    )
    campground.save
    render json: campground
  end

  def show
    campground = Campground.find_by(id: params[:id])
    render json: campground
  end

  def update
    campground = Campground.find_by(id: params[:id])
    campground.lon = params[:lon] || campground.lon
    campground.lat = params[:lat] || campground.lat
    campground.gps_composite_field = params[:gps_composite_field] || campground.gps_composite_field
    campground.campground_code = params[:campground_code] || campground.campground_code
    campground.campground_name = params[:campground_name] || campground.campground_name
    campground.type = params[:type] || campground.type
    campground.phone_number = params[:phone_number] || campground.phone_number
    campground.dates_open = params[:dates_open] || campground.dates_open
    campground.comments = params[:comments] || campground.comments
    campground.number_of_campsites = params[:number_of_campsites] || campground.number_of_campsites
    campground.elevation = params[:elevation] || campground.elevation
    campground.amenities = params[:amenities] || campground.amenities
    campground.state = params[:state] || campground.state
    campground.nearest_town = params[:nearest_town] || campground.nearest_town
    campground.save
    render json: campground
  end

  def destroy
    campground = Campground.find_by(id: params[:id])
    campground.destroy
    render json: {message: "Campground destroyed"}
  end 
  
end
