require 'rails_helper'

RSpec.describe SearchFacade do
  describe '#search_facade' do
    it 'returns books', :vcr do
      
      location = "denver,co"

      search_results = SearchFacade.search_books(location)

      expect(search_results).to be_a(Array)
    end
  end
end