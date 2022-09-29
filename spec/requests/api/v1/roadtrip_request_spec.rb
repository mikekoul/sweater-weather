require 'rails_helper'

describe 'RoadTrip API' do
  before :each do
    @user_info = { 
      "email": 'mikek@gmail.com',
      "password": 'pass123',
      "password_confirmation": 'pass123'
    }
    headers = {"CONTENT_TYPE" => "application/json"}
    post '/api/v1/users', headers: headers, params: JSON.generate(@user_info)
    result = JSON.parse(response.body, symbolize_names: true)
    @api_key = result[:data][:attributes][:api_key]
  end

  it 'returns a successfully formatted roadtrip response', :vcr do
    roadtrip_info = {
      "origin": "Denver,CO",
      "destination": "Santa Fe, NM",
      "api_key": "@api_key"
    } 

    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(roadtrip_info)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
  end
end