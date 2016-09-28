class UsersController < ApplicationController

    def user_params
        params.require(:user_id).permit(:email, :session_token)
    end
    
    def new
       # default: render 'new' template
    end
    
    def create
        if User.find(params[:user_id]) == nil
            @user = User.create_user!(params[:user])
            flash[:notice] = "Welcome #{@user.user_id}. Your account has been created."
            redirect_to movies_path
        else
           flash[:warning] = "Sorry, this user-id is taken. Try again."
           redirect_to new_user_path
        end
    end
end