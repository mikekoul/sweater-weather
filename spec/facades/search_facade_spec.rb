require 'rails_helper'

RSpec.describe SearchFacade do
  describe '#search_facade' do
    it 'returns books', :vcr do
      
      location = "denver,co"
      quantity = 5

      search_results = SearchFacade.search_books(quantity)

      expect(search_results).to be_a(Array)
      expect(search_results.size).to eq(5)
    end
  end
end