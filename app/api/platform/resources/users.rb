module Platform
  class Resources::Users < Grape::API
    resource :users do
      get do
        '/users'
      end
    end
  end
end