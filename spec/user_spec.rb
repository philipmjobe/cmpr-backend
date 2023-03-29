require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #create' do
    let(:valid_params) do
      {
        first_name: 'John',
        last_name: 'Doe',
        email: 'johndoe@example.com',
        password: 'password',
        password_confirmation: 'password'
      }
    end

    let(:invalid_params) do
      {
        first_name: 'John',
        last_name: 'Doe',
        email: 'invalid_email',
        password: 'password',
        password_confirmation: 'different_password'
      }
    end

    it 'creates a new user with valid params' do
      expect {
        post :create, params: valid_params
      }.to change(User, :count).by(1)
      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq('User created successfully')
    end

    it 'does not create a new user with invalid params' do
      expect {
        post :create, params: invalid_params
      }.to_not change(User, :count)
      expect(response).to have_http_status(:bad_request)
    end
  end
end
