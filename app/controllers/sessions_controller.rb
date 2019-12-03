class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:notice] = "Sorry, we can't find a user with that username and password"
          redirect_to new_session_path
        end
      end
      

end
