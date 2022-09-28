require 'rails_helper'

RSpec.describe MapService do
  describe '#map_service' do
    it 'returns a response lat and long for a given city', :vcr do

      response = MapService.location('denver, co')

      expect(response).to be_a(Hash)
      expect(response).to have_key(:results)
      expect(response[:results]).to be_a(Array)
      expect(response[:results].last).to have_key(:locations)
      expect(response[:results].last).to be_a(Hash)
      expect(response[:results].last[:locations].first).to have_key(:latLng)
      expect(response[:results].last[:locations].first[:latLng]).to have_key(:lat)
      expect(response[:results].last[:locations].first[:latLng][:lat]).to be_a(Float)
      expect(response[:results].last[:locations].first[:latLng]).to have_key(:lng)
      expect(response[:results].last[:locations].first[:latLng][:lng]).to be_a(Float)
    end

    it 'returns route information when a start and end location is provided', :vcr do

      response = MapService.route('denver,co', 'santa fe, nm')

      expect(response).to be_a(Hash)
      expect(response).to have_key(:route)
      expect(response[:route]).to be_a(Hash)
      expect(response[:route]).to have_key(:formattedTime)
      expect(response[:route][:formattedTime]).to be_a(String)
    end
  end
end