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
    expect(response.status).to eq(201)
    expect(result).to be_a(Hash)
  end
end