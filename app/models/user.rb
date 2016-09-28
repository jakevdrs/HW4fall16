class User < ActiveRecord::Base
    
    def create_user!(user_hash)
        session[:session_token] = SecureRandom.base64
        user_hash << session[:session_token]
        @user = User.create!(user_hash)
    end
end