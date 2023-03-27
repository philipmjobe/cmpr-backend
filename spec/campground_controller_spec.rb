require 'rails_helper'

RSpec.describe CampgroundsController, type: :controller do

  describe 'GET #index' do
    let!(:campgrounds) { create_list(:campground, 3) }
    before { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns all campgrounds' do
      expect(assigns(:campgrounds)).to match_array(campgrounds)
    end

    it 'returns json response' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'POST #create' do
    let!(:campground_params) { attributes_for(:campground) }
    before { post :create, params: { campground: campground_params } }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'creates a new campground' do
      expect { post :create, params: { campground: campground_params } }.to change(Campground, :count).by(1)
    end

    it 'returns json response' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'GET #show' do
    let!(:campground) { create(:campground) }
    before { get :show, params: { id: campground.id } }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns the campground' do
      expect(assigns(:campground)).to eq(campground)
    end

    it 'returns json response' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'PATCH/PUT #update' do
    let!(:campground) { create(:campground) }
    let!(:campground_params) { attributes_for(:campground) }
    before { patch :update, params: { id: campground.id, campground: campground_params } }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'updates the campground' do
      campground.reload
      expect(campground.lon).to eq(campground_params[:lon])
      expect(campground.lat).to eq(campground_params[:lat])
      expect(campground.gps_composite_field).to eq(campground_params[:gps_composite_field])
      # ... expect other fields to be updated as well
    end

    it 'returns json response' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end

  describe 'DELETE #destroy' do
    let!(:campground) { create(:campground) }
    before { delete :destroy, params: { id: campground.id } }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'deletes the campground' do
      expect { delete :destroy, params: { id: campground.id } }.to change(Campground, :count).by(-1)
    end

    it 'returns json response' do
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end
  end
end