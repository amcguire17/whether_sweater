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

      user = JSON.parse(response.body, symbolize_names: true)[:data]
      binding.pry
      expect(user[:id]).to have_key(nil)
      expect(user[:type]).to eq('roadtrip')
      expect(user[:attributes]).to have_key(:start_city)
      expect(user[:attributes]).to have_key(:end_city)
      expect(user[:attributes]).to have_key(:travel_time)
      expect(user[:attributes]).to have_key(:weather_at_eta)
      expect(user[:attributes]).to have_key(:weather_at_eta)
      expect(user[:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(user[:attributes][:weather_at_eta]).to have_key(:conditions)
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

      user = JSON.parse(response.body, symbolize_names: true)
      expect(user[:message]).to eq("Authentication failed.")
    end

    it 'returns impossible if route is not valid' do
      post_params = {
        origin: "Denver, CO",
        destination: "Honolulu, HI",
        api_key: "#{@user.api_key}"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/road_trip", headers: headers, params: JSON.generate(post_params)

      expect(response).to_not be_successful

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:attributes][:travel_time]).to eq("impossible")
      expect(user[:attributes][:weather_at_eta][:temperature]).to eq(nil)
      expect(user[:attributes][:weather_at_eta][:conditions]).to eq(nil)
    end
  end
end
