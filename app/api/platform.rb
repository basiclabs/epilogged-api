module Platform
  class API < Grape::API
    version 'v1', using: :header, vendor: 'epilogged'
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    get do
      '/'
    end
    
    mount Platform::Resources::Users
  end
end