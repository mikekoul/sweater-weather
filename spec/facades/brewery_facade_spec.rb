require 'rails_helper'

RSpec.describe BreweryFacade do
  describe '#brewery_facade' do
    it 'return breweries in a given location', :vcr do

      location = "denver"
      quantity = 5

      results = BreweryFacade.search_brewery(location, quantity)

      expect(results).to be_a(Array)
      expect(results.size).to eq(5)
    end
  end
end