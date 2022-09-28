require 'rails_helper'

describe 'Session API' do
  before :each do
    @email = 'mikek@gmail.com'
    @password = 'password123'
    @api_key = 'b31f87bc0072b42a8b6ae7b88f28b4f8'
    User.create!(email: @email, password: @password, api_key: @api_key)
  end

  it 'returns json response with an API for an existing user' do
    credentials = {
      email: @email,
      password: @password
    }

    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/sessions', headers: headers, params: JSON.generate(credentials)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(result).to be_a(Hash)
    expect(result).to have_key(:data)
    expect(result[:data]).to have_key(:type)
    expect(result[:data][:type]).to eq("users")
    expect(result[:data]).to have_key(:id)
    expect(result[:data][:id]).to be_a(Integer)
    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to be_a(Hash)
    expect(result[:data][:attributes]).to have_key(:email)
    expect(result[:data][:attributes][:email]).to be_a(String)
    expect(result[:data][:attributes]).to have_key(:api_key)
    expect(result[:data][:attributes][:api_key]).to be_a(String)
  end
end

describe "#sad_path" do
  it 'returns an error if wrong email is entered' do
    credentials = {
      email: "wrongemail@mail.com",
      password: @password
    }

    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/sessions', headers: headers, params: JSON.generate(credentials)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(result[:data][:message]).to eq('Invalid Credentials')
  end

  it 'returns an error if wrong email is entered' do
    credentials = {
      email: @email,
      password: 'wrongpass'
    }

    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/sessions', headers: headers, params: JSON.generate(credentials)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(result[:data][:message]).to eq('Invalid Credentials')
  end
end