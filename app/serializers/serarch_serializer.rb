class SearchSerializer
  include JSONAPI::Serializer

# needs initializer
  def initialize(response_data)
  end

  def response
    {
      "data": {
        "id": "null",
        "type": "books",
        "attributes": {
          #not sure where to get the destination from
          "destination": [params[:location]],
          "forecast": {
            "summary": @cw.condition,
            "temperature": @cw.temperature
          },
          #not sure how to pull the numfound data here
          "total_books_found": data[:numFound],
          "books": [
          {
            "isbn": [
              @search.isbn[0],
              @search.isbn[1]
            ],
            "title": @search.title,
            "publisher": [
              @search.publisher
            ]
          },
          {
            "isbn": [
              @search.isbn[0],
              @search.isbn[1]
            ],
            "title": @search.title,
            "publisher": [
              @search.publisher
            ]
          },
          {
            "isbn": [
              @search.isbn[0],
              @search.isbn[1]
            ],
            "title": @search.title,
            "publisher": [
              @search.publisher
            ]
          },
          {
            "isbn": [
              @search.isbn[0],
              @search.isbn[1]
            ],
            "title": @search.title,
            "publisher": [
              @search.publisher
            ]
          },
          {
            "isbn": [
              @search.isbn[0],
              @search.isbn[1]
            ],
            "title": @search.title,
            "publisher": [
              @search.publisher
            ]
          }
        ]
      }
    }
  end 
end