require 'rails_helper'

describe 'User Account Creation API' do
  it 'registers a user, creates a user, and returns api key' do
    user_info = { 
      "email": 'mikek@gmail.com',
      "password": 'pass123',
      "password_confirmation": 'pass123'
    }

    post '/api/v1/users', params: user_info

    result = JSON.parse(response.body, symbolize_names: true)
    
    expect(response).to be_successful
    expect(result).to be_a(Hash)
  end
end