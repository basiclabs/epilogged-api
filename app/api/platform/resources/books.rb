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
    end
  end
end