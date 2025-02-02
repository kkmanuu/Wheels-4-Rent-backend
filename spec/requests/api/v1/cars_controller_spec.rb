require 'rails_helper'

RSpec.describe 'Api::V1::CarsControllers', type: :request do
  describe 'GET /index' do
    it 'returns a success response' do
      get '/api/v1/reservation'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    let(:car) { create(:car) }

    it 'returns a success response' do
      get "/api/v1/cars/#{car.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) { { car: attributes_for(:car) } }

      it 'creates a new car' do
        expect do
          post '/api/v1/cars', params: valid_attributes
        end.to change(Car, :count).by(1)
      end

      it 'returns a success response' do
        post '/api/v1/cars', params: valid_attributes
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:car) { create(:car) }

    it 'destroys the requested car' do
      expect do
        delete "/api/v1/cars/#{car.id}"
      end.to change(Car, :count).by(-1)
    end

    it 'returns a success response' do
      delete "/api/v1/cars/#{car.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
