require 'rails_helper'

describe 'Weather Forecast API' do
  it 'returns current weather forecast, 5 day weather forecast, and hourly weather forecast', :vcr do

    get "/api/v1/forecast?location=denver,co"

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(data).to be_a(Hash)
    expect(data).to have_key(:id)
    expect(data[:id]).to eq(nil)
    expect(data).to have_key(:type)
    expect(data[:type]).to eq("forecast")
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to be_a(Hash)
    expect(data[:attributes]).to have_key(:current_weather)
    expect(data[:attributes][:current_weather]).to be_a(Hash)
    expect(data[:attributes][:current_weather]).to have_key(:datetime)
    expect(data[:attributes][:current_weather][:datetime]).to be_a(String)
    expect(data[:attributes][:current_weather]).to have_key(:sunrise)
    expect(data[:attributes][:current_weather][:sunrise]).to be_a(String)
    expect(data[:attributes][:current_weather]).to have_key(:temperature)
    expect(data[:attributes][:current_weather][:temperature]).to be_a(Float)
    expect(data[:attributes][:current_weather]).to have_key(:feels_like)
    expect(data[:attributes][:current_weather][:feels_like]).to be_a(Float)
    expect(data[:attributes][:current_weather]).to have_key(:humidity)
    expect(data[:attributes][:current_weather][:humidity]).to be_an(Integer)
    expect(data[:attributes][:current_weather]).to have_key(:uvi)
    expect(data[:attributes][:current_weather][:uvi].to_f).to be_a(Float)
    expect(data[:attributes][:current_weather]).to have_key(:visibility)
    expect(data[:attributes][:current_weather][:visibility]).to be_an(Integer)
    expect(data[:attributes][:current_weather]).to have_key(:conditions)
    expect(data[:attributes][:current_weather][:conditions]).to be_a(String)
    expect(data[:attributes][:current_weather]).to have_key(:icon)
    expect(data[:attributes][:current_weather][:icon]).to be_a(String)

    dw = data[:attributes][:daily_weather]
    dw.each do |daily|
      expect(daily).to have_key(:date)
      expect(daily[:date]).to be_a(String)
      expect(daily).to have_key(:sunrise)
      expect(daily[:sunrise]).to be_a(String)
      expect(daily).to have_key(:sunset)
      expect(daily[:sunset]).to be_a(String)
      expect(daily).to have_key(:min_temp)
      expect(daily[:min_temp]).to be_a(Float)
      expect(daily).to have_key(:max_temp)
      expect(daily[:max_temp].to_f).to be_a(Float)
      expect(daily).to have_key(:conditions)
      expect(daily[:conditions]).to be_a(String)
      expect(daily).to have_key(:icon)
      expect(daily[:icon]).to be_a(String)
    end
    
    hw = data[:attributes][:hourly_weather]
    hw.each do |hour|
      expect(hour).to have_key(:time)
      expect(hour).to have_key(:temperature)
      expect(hour[:temperature].to_f).to be_a(Float)
      expect(hour[:time]).to be_a(String)
      expect(hour).to have_key(:conditions)
      expect(hour[:conditions]).to be_a(String)
      expect(hour).to have_key(:icon)
      expect(hour[:icon]).to be_a(String)
    end
  end
end

  describe '#sad_path' do
    it 'returns an error message if no location is given' do
      get "/api/v1/forecast?location="

    data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to_not be_successful
    expect(response.status).to eq(400)
    end
  end