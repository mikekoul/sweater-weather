require 'rails_helper'

describe 'User Account Creation API' do
  it 'registers a user, creates a user, and returns api key' do
    user_info = { 
      "email": 'mikek@gmail.com',
      "password": 'pass123',
      "password_confirmation": 'pass123'
    }

    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/users', headers: headers, params: JSON.generate(user_info)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(201)
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
    it 'returns an error when the passwords do not match' do
      user_info = { 
      "email": 'mikek@gmail.com',
      "password": 'pass123',
      "password_confirmation": 'testtest'
    }

    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/users', headers: headers, params: JSON.generate(user_info)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(result[:data][:message]).to eq('Passwords do not match')
    end

    it 'returns an error ' do
      user_1 = { 
      "email": 'mikek@gmail.com',
      "password": 'pass123',
      "password_confirmation": 'pass123'
    }

    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/users', headers: headers, params: JSON.generate(user_1)

    user_2 = { 
      "email": 'mikek@gmail.com',
      "password": 'pass1234',
      "password_confirmation": 'pass1234'
    }

    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/users', headers: headers, params: JSON.generate(user_2)


    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(result[:data][:message]).to eq('Email already exists')
    end

    it 'returns an error when the passwords do not match' do
      user_info = { 
      "email": '',
      "password": 'pass123',
      "password_confirmation": 'pass123'
    }

    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/users', headers: headers, params: JSON.generate(user_info)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    expect(result[:data][:message]).to eq('Invalid Credentials')
    end
  end

