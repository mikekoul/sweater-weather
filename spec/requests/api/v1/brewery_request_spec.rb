require 'rails_helper'

describe 'Brewery Search API' do
  it 'returns breweries based on search params', :vcr do
    
    get "/api/v1/breweries?location=denver&quantity=5"

    data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(data).to be_a(Hash)
    expect(data).to have_key(:id)
    expect(data[:id]).to eq(nil)
    expect(data).to have_key(:type)
    expect(data[:type]).to eq("breweries")
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to be_a(Hash)
    expect(data[:attributes]).to have_key(:destination)
    expect(data[:attributes][:destination]).to be_a(String)
    expect(data[:attributes]).to have_key(:forecast)
    expect(data[:attributes][:forecast]).to have_key(:summary)
    expect(data[:attributes][:forecast][:summary]).to be_a(String)
    expect(data[:attributes][:forecast]).to have_key(:temperature)
    expect(data[:attributes][:forecast][:temperature]).to be_a(String)
    expect(data[:attributes]).to have_key(:breweries)
    expect(data[:attributes][:breweries]).to be_a(Array)

    list = data[:attributes][:breweries]
    list.each do |brew|
      expect(brew).to have_key(:id)
      expect(brew[:id]).to be_a(String)
      expect(brew).to have_key(:name)
      expect(brew[:name]).to be_a(String)
      expect(brew).to have_key(:brewery_type)
      expect(brew[:name]).to be_a(String)
    end
  end
end