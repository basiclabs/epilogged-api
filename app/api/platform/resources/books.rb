module Platform
  class Resources::Books < Grape::API
    resource :books do

      params do
        requires :keyword,    type: String, desc: "Title, Author or ISBN"
      end
      get 'search' do
        cache("search_by_#{params[:keyword]}") do
          CardCatalog::Search.by_keyword(params[:keyword])
        end
      end

      get 'advanced' do
        h = params.select {|k,v| ['ISBN', 'title', 'author'].include?(k) }
        cache("search_#{h.map { |k, v| "#{k}:#{v}" }.join('_')}") do
          CardCatalog::Search.by_attrs(h)
        end
      end
    end
  end
end