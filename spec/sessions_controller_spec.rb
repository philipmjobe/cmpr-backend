RSpec.describe SessionsController, type: :controller do
  let!(:user) { create(:user, email: 'user@example.com', password: 'password') }
  
  describe 'POST #create' do
    context 'with valid credentials' do
      it 'returns a JWT token' do
        post :create, params: { email: user.email, password: 'password' }
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to include('jwt', 'email', 'user_id')
      end
    end

    context 'with invalid credentials' do
      it 'returns unauthorized status' do
        post :create, params: { email: user.email, password: 'wrong_password' }
        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)).to be_empty
      end
    end

    context 'when user does not exist' do
      it 'returns unauthorized status' do
        post :create, params: { email: 'nonexistent@example.com', password: 'password' }
        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)).to be_empty
      end
    end
  end
end
