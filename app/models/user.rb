class User < ActiveRecord::Base
    
    def User::create_user!(user_hash)
        session[:session_token] = SecureRandom.base64
        user_hash << session[:session_token]
        return User.create!(user_hash)
    end
end