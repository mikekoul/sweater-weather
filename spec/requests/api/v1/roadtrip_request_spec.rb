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
    expect(result).to be_a(Hash)
    expect(result).to have_key(:data)
    expect(result[:data]).to have_key(:id)
    expect(result[:data][:id]).to eq(nil)
    expect(result[:data]).to have_key(:type)
    expect(result[:data][:type]).to eq("roadtrip")
    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to have_key(:start_city)
    expect(result[:data][:attributes][:start_city]).to be_a(String)
    expect(result[:data][:attributes]).to have_key(:end_city)
    expect(result[:data][:attributes][:end_city]).to be_a(String)
    expect(result[:data][:attributes]).to have_key(:travel_time)
    expect(result[:data][:attributes][:travel_time]).to be_a(String)
    expect(result[:data][:attributes]).to have_key(:weather_at_eta)
    expect(result[:data][:attributes][:weather_at_eta]).to be_a(Hash)
    expect(result[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(result[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
    expect(result[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(result[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
  end
end

describe '#sad_path' do
  it 'returns an error if no api key is given', :vcr do
    roadtrip_info = {
      "origin": "Denver,CO",
      "destination": "Santa Fe, NM",
      "api_key": ""
    } 

    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(roadtrip_info)

    result = JSON.parse(response.body, symbolize_names: true)
    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end

  it 'returns an error if bad api key is given', :vcr do
    roadtrip_info = {
      "origin": "Denver,CO",
      "destination": "Santa Fe, NM",
      "api_key": "badapikey"
    } 

    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(roadtrip_info)

    result = JSON.parse(response.body, symbolize_names: true)
    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end
end