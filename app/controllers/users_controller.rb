class UsersController < ApplicationController

  def homepage
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path 
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user && @user.authenticate(params[:user][:old_password]) && params[:user][:password] == params[:user][:new_password_confirm]
      @user.update(user_params)
      redirect_to user_path(@user)
    else 
      flash[:notice] = "Sorry, some of the details don't match. Please try again"
      render :edit
    end

  end

  def destroy
  end


  private 

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end 

end
