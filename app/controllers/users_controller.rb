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
  end

  def update
  end

  def destroy
  end


  private 

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end 

end
