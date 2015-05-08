class CardCatalog::Search
  class << self
    
    def request
      @request ||= Vacuum.new
      @request.associate_tag = ENV['AWS_ASSOCIATE_TAG']
      @request
    end

    def by_keyword(keyword)
      puts 'HELLO AMAZON'
      response = request.item_search( query: {
        'Power' => "title:#{keyword} or author:#{keyword} or ISBN:#{keyword}",
        'SearchIndex' => 'Books',
        'ResponseGroup' => 'Images,ItemAttributes'
      })
      CardCatalog::Transform.from_amazon(response)
    end
  end
end