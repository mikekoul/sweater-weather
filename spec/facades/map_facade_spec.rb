require 'rails_helper'

RSpec.describe MapFacade do
  describe '#map_facade' do
    it 'returns latitude and longitude of a searched city', :vcr do

      coors = MapFacade.lat_long('denver, co')

      expect(coors.first).to eq(39.738453)
      expect(coors.last).to eq(-104.984853)
    end
  end
end