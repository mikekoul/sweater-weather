class SearchSerializer
  include JSONAPI::Serializer

  
  def response
    {
      "data": {
        "id": "null",
        "type": "books",
        "attributes": {
          "destination": [params[:location]],
          "forecast": {
            "summary": @cw.condition,
            "temperature": @cw.temperature
          },
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