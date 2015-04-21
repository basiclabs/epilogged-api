module Platform
  class Resources::Sessions < Grape::API
    resource :sessions do

      desc "Creates and returns access_token if valid login"
      params do
        requires :email,    type: String, desc: "Username or email address"
        requires :password, type: String, desc: "Password"
      end
      post do
        user = User.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
          key = ApiKey.create(user_id: user.id)
          {token: key.access_token}
        else
          error!('Unauthorized.', 401)
        end
      end

      desc "Returns pong if logged in correctly"
      get :ping do
        authenticate!
        { message: "pong" }
      end
    end 
  end
end