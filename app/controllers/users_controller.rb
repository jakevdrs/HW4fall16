class UsersController < ApplicationController

    def user_params
        params.require(:user_id).permit(:email, :session_token)
    end
    
    def show
        id = params[:id]
        @user = User.find(id)
    end
    
    def new
       # default: render 'new' template
    end
    
    def index
        @users = User.all
    end
    
    def create
        @user = User.create_user!(params[:user])
        
        if !!(@user)
            flash[:notice] = "Welcome #{@user.user_id}. Your account has been created."
            redirect_to movies_path
        else
           flash[:warning] = "Sorry, this user-id is taken. Try again."
           redirect_to new_user_path
        end
    end
    
    def edit
        @user = User.find params[:id]
    end
    
    def update
        @user = User.find params[:id]
        @user.update_attributes!(user_params)
        flash[:notice] = "#{@user.title} was successfully updated."
        redirect_to user_path(@user)
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        flash[:notice] = "User '#{@user.title}' deleted."
        redirect_to users_path
    end
end