require 'rails_helper'

RSpec.describe CampgroundsController, type: :controller do
  describe "#index" do
    let!(:campgrounds) { create_list(:campground, 3) }

    it "returns a list of all campgrounds in JSON format" do
      get :index
      expect(response.body).to eq(campgrounds.to_json)
    end

    it "returns a 200 status code" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#create" do
    let(:params) do
      {
        lon: 42.365,
        lat: -71.104,
        gps_composite_field: "42.365,-71.104",
        campground_code: "AA123",
        campground_name: "Test Campground",
        campground_type: "Tent Only",
        phone_number: "555-555-5555",
        dates_open: "May-October",
        comments: "Some comments",
        number_of_campsites: 10,
        elevation: 1000,
        amenities: "Fire pits, picnic tables",
        state: "MA",
        nearest_town: "Boston"
      }
    end

    it "creates a new campground with valid params" do
      expect do
        post :create, params: params
      end.to change(Campground, :count).by(1)
    end

    it "returns the newly created campground in JSON format" do
      post :create, params: params
      campground = Campground.last
      expect(response.body).to eq(campground.to_json)
    end

    it "returns a 200 status code" do
      post :create, params: params
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#show" do
    let!(:campground) { create(:campground) }

    it "returns the requested campground in JSON format" do
      get :show, params: { id: campground.id }
      expect(response.body).to eq(campground.to_json)
    end

    it "returns a 200 status code" do
      get :show, params: { id: campground.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PATCH #update' do
    let!(:campground) { create(:campground) }
    let(:updated_params) do
      {
        lon: 2.345,
        lat: 1.234,
        gps_composite_field: "new GPS composite field",
        campground_code: "new campground code",
        campground_name: "new campground name",
        campground_type: "new campground type",
        phone_number: "new phone number",
        dates_open: "new dates open",
        comments: "new comments",
        number_of_campsites: 10,
        elevation: 500,
        amenities: "new amenities",
        state: "new state",
        nearest_town: "new nearest town"
      }
    end

    context 'with valid params' do
      it 'updates the campground and returns the updated object' do
        patch :update, params: { id: campground.id, campground: updated_params }
        campground.reload
        expect(campground.lon).to eq(updated_params[:lon])
        expect(campground.lat).to eq(updated_params[:lat])
        expect(campground.gps_composite_field).to eq(updated_params[:gps_composite_field])
        expect(campground.campground_code).to eq(updated_params[:campground_code])
        expect(campground.campground_name).to eq(updated_params[:campground_name])
        expect(campground.campground_type).to eq(updated_params[:campground_type])
        expect(campground.phone_number).to eq(updated_params[:phone_number])
        expect(campground.dates_open).to eq(updated_params[:dates_open])
        expect(campground.comments).to eq(updated_params[:comments])
        expect(campground.number_of_campsites).to eq(updated_params[:number_of_campsites])
        expect(campground.elevation).to eq(updated_params[:elevation])
        expect(campground.amenities).to eq(updated_params[:amenities])
        expect(campground.state).to eq(updated_params[:state])
        expect(campground.nearest_town).to eq(updated_params[:nearest_town])
        expect(response).to have_http_status(:success)
        expect(response.body).to eq(campground.to_json)
      end
    end

    context 'with invalid params' do
      it 'does not update the campground and returns an error' do
        patch :update, params: { id: campground.id, campground: { lon: nil } }
        campground.reload
        expect(campground.lon).not_to eq(nil)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:campground) { create(:campground) }

    it 'destroys the campground and returns a success message' do
      delete :destroy, params: { id: campground.id }
      expect(Campground.count).to eq(0)
      expect(response).to have_http_status(:success)
      expect(response.body).to eq({message: "Campground destroyed"}.to_json)
    end
  end
end
