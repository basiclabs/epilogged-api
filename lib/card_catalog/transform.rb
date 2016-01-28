class CardCatalog::Transform
  class << self
    # Transform results from Amazon
    def from_amazon(response)
      items = if (response.to_h['ItemSearchResponse']['Items']['TotalResults'].to_i > 0)
        response.to_h['ItemSearchResponse']['Items']['Item']
      else
        []
      end
      items.map do |item|
        {
          title: item.try(:[], 'ItemAttributes').try(:[], 'Title'),
          author: item.try(:[], 'ItemAttributes').try(:[], 'Author'),
          thumb: item.try(:[], 'ImageSets').try(:[], 'ImageSet').try(:[], 0).try(:[], 'SmallImage').try(:[], 'URL')
        }
      end
    end
  end
end