module Platform
  class Resources::Users < Grape::API
    resource :users do
      get 'me' do
        authenticate!
        current_user
      end
    end
  end
end