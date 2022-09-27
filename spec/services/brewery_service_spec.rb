require 'rails_helper'

RSpec.describe BreweryService do
  describe '#brewery_service' do
    it 'return breweries in a given location', :vcr do
      
      response = BreweryService.get_location_brewery("denver", 5)

      expect(response).to be_a(Array)
      expect(response[0]).to have_key(:id)
      expect(response[0][:id]).to be_a(String)
      expect(response[0]).to have_key(:name)
      expect(response[0][:name]).to be_a(String)
      expect(response[0]).to have_key(:brewery_type)
      expect(response[0][:brewery_type]).to be_a(String)
      expect(response[0]).to have_key(:brewery_type)
      expect(response[0][:brewery_type]).to be_a(String)
      expect(response[0]).to have_key(:street)
      expect(response[0][:street]).to be_a(String)
      expect(response[0]).to have_key(:city)
      expect(response[0][:city]).to be_a(String)
      expect(response[0]).to have_key(:state)
      expect(response[0][:state]).to be_a(String)
      expect(response[0]).to have_key(:postal_code)
      expect(response[0][:postal_code]).to be_a(String)
      expect(response[0]).to have_key(:country)
      expect(response[0][:country]).to be_a(String)
      expect(response[0]).to have_key(:longitude)
      expect(response[0][:longitude]).to be_a(String)
      expect(response[0]).to have_key(:latitude)
      expect(response[0][:latitude]).to be_a(String)
      expect(response[0]).to have_key(:phone)
      expect(response[0][:phone]).to be_a(String)
    end
  end
end