require 'rails_helper'

describe 'Users' do
  describe 'POST new user' do
    it 'creates a new user' do
      post_params = {
        email: "newuser@example.com",
        password: "password",
        password_confirmation: "password"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: JSON.generate(post_params)

      expect(response).to be_successful
      expect(response.status).to eq(201)

      user = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(user).to have_key(:id)
      expect(user[:type]).to eq('users')
      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes]).to have_key(:api_key)
    end

    it 'returns an error is passwords do not match' do
      post_params = {
        email: "newuser@example.com",
        password: "password12",
        password_confirmation: "password"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: JSON.generate(post_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      user = JSON.parse(response.body, symbolize_names: true)
      expect(user[:message].first).to eq("Password confirmation doesn't match Password")
    end

    it 'returns an error if email already exists' do
      post_params = {
        email: "newuser@example.com",
        password: "password",
        password_confirmation: "password"
      }

      User.create(post_params)

      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: JSON.generate(post_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      user = JSON.parse(response.body, symbolize_names: true)
      expect(user[:message].first).to eq("Email has already been taken")
    end

    it 'returns an error if a field is missing' do
      post_params = {
        email: "",
        password: "password",
        password_confirmation: "password"
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/users", headers: headers, params: JSON.generate(post_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      user = JSON.parse(response.body, symbolize_names: true)
      expect(user[:message].first).to eq("Email can't be blank")
    end
  end
end
