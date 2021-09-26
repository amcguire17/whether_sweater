require 'rails_helper'

describe 'Sessions' do
  describe 'POST new session' do
    before :each do
      User.create({email: "user@example.com", password: "password", password_confirmation: "password"})
    end
    it 'creates a new session' do
      post_params = {
        email: "user@example.com",
        password: "password"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/sessions", headers: headers, params: JSON.generate(post_params)

      expect(response).to be_successful
      expect(response.status).to eq(200)

      user = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(user).to have_key(:id)
      expect(user[:type]).to eq('users')
      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes]).to have_key(:api_key)
    end

    it 'returns an error if password is incorrect' do
      post_params = {
        email: "user@example.com",
        password: "password12"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/sessions", headers: headers, params: JSON.generate(post_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      user = JSON.parse(response.body, symbolize_names: true)
      expect(user[:message]).to eq("Something is wrong. Please try again.")
    end

    it 'returns an error if email is incorrect' do
      post_params = {
        email: "newuser@example.com",
        password: "password"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/sessions", headers: headers, params: JSON.generate(post_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      user = JSON.parse(response.body, symbolize_names: true)
      expect(user[:message]).to eq("Something is wrong. Please try again.")
    end
  end
end
