class CardCatalog::Search
  class << self
    
    def request
      @request ||= Vacuum.new
      @request.associate_tag = ENV['AWS_ASSOCIATE_TAG']
      @request
    end

    def by_keyword(keyword)
      request.item_search( query: {
        'Power' => "title:#{keyword} or author:#{keyword} or ISBN:#{keyword}",
        'SearchIndex' => 'Books',
        'ResponseGroup' => 'Images,ItemAttributes'
      }).to_h
    end
  end
end