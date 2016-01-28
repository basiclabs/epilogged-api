class CardCatalog::Search
  class << self
    
    def request
      @request ||= Vacuum.new
      @request.associate_tag = ENV['AWS_ASSOCIATE_TAG']

      @request.configure(
        aws_access_key_id: 'AKIAJCUV6ROVDN3OZREQ',
        aws_secret_access_key: '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',
        associate_tag: 'epilogged-20'
      )

      @request
    end

    def by_keyword(keyword)
      response = request.item_search( query: {
        'Power' => "title:#{keyword} or author:#{keyword} or ISBN:#{keyword}",
        'SearchIndex' => 'Books',
        'ResponseGroup' => 'Images,ItemAttributes'
      })
      CardCatalog::Transform.from_amazon(response)
    end
  end
end