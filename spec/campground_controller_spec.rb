require 'rails_helper'

RSpec.describe CampgroundsController, type: :controller do
  describe "GET index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST create" do
    it 'successfully creates a new campground' do
      post :create, params: {
        campground: {
        campground_name: "camp hole",
        campground_type: "tent",
        phone_number: "8888888888"
        }
      }
      expect(response).to be_successful
    end
  end
end