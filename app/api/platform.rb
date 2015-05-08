module Platform
  class API < Grape::API
    version 'v1', using: :header, vendor: 'epilogged'
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    helpers Platform::Helpers::Auth
    helpers Platform::Helpers::Cache

    mount Platform::Resources::Users
    mount Platform::Resources::Sessions
    mount Platform::Resources::Books
  end
end