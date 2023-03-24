require 'rails_helper'

RSpec.describe CampgroundsController, type: :controller do
  describe "GET index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end
  end
end