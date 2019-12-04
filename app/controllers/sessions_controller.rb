class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:destroy]

    def new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:notice] = "Sorry, we can't find a user with that username and password"
          render :new
        end
    end

  def destroy
    session.destroy
    redirect_to new_session_path
  end
      

end
