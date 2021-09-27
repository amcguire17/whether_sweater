require 'rails_helper'

describe 'Road Trip' do
  describe 'POST new road trip', :vcr do
    before :each do
      @user = User.create({email: "user@example.com", password: "password", password_confirmation: "password"})
    end
    it 'creates a new road trip' do
      post_params = {
        origin: "Denver, CO",
        destination: "Chicago, IL",
        api_key: "#{@user.api_key}"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/road_trip", headers: headers, params: JSON.generate(post_params)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      road_trip = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(road_trip[:id]).to eq(nil)
      expect(road_trip[:type]).to eq('roadtrip')
      expect(road_trip[:attributes]).to have_key(:start_city)
      expect(road_trip[:attributes]).to have_key(:end_city)
      expect(road_trip[:attributes]).to have_key(:travel_time)
      expect(road_trip[:attributes]).to have_key(:weather_at_eta)
      expect(road_trip[:attributes]).to have_key(:weather_at_eta)
      expect(road_trip[:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(road_trip[:attributes][:weather_at_eta]).to have_key(:conditions)
    end

    it 'returns an error if api key is incorrect' do
      post_params = {
        origin: "Denver, CO",
        destination: "Chicago, IL",
        api_key: ""
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/road_trip", headers: headers, params: JSON.generate(post_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(401)

      road_trip = JSON.parse(response.body, symbolize_names: true)
      expect(road_trip[:message]).to eq("Authentication failed.")
    end

    it 'returns impossible if route is not valid' do
      post_params = {
        origin: "Denver, CO",
        destination: "Honolulu, HI",
        api_key: "#{@user.api_key}"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/road_trip", headers: headers, params: JSON.generate(post_params)

      expect(response).to be_successful

      road_trip = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(road_trip[:attributes][:travel_time]).to eq("impossible")
      expect(road_trip[:attributes][:weather_at_eta][:temperature]).to eq(nil)
      expect(road_trip[:attributes][:weather_at_eta][:conditions]).to eq(nil)
    end
  end
end
