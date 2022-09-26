require 'rails_helper'

describe 'Book Search API' do
  it 'returns books based on params', :vcr do

    get "/api/v1/book-search?location=denver,co&quantity=5"

    data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
  end
end