require 'rails_helper'

describe 'Weather Forecast API' do
  it 'returns current weather forecast, 5 day weather forecast, and hourly weather forecast' do

    get "/api/v1/forecast?location=denver,co"

    data = JSON.parse(response.body, symbolize_names: true)

    exect(response).to be_successful
    expect(data).to be_a(Hash)
  end
end