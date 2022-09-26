require 'rails_helper'

RSpec.describe MapService do
  describe '#map_service' do
    it 'returns a response lat and long for a given city' do

      city = 'denver, co'

      response = MapService.new.location(city)

      expect(response).to be_a(Hash)

    end
  end
end