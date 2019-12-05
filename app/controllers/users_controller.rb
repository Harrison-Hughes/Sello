class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def homepage
    @user = User.new
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to user_path(@user)
      session[:user_id] = @user.id
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
  end

  def update
    if @user && @user.authenticate(params[:user][:old_password]) && params[:user][:password] == params[:user][:new_password_confirm]
      @user.update(user_params)
      redirect_to user_path(@user)
    else
      flash[:notice] = "Sorry, some of the details don't match. Please try again"
      render :edit
    end
  end

  def account_check
  end

  def forgot_password
    @user = User.find_by(email: params[:email])
    if @user 
      render :retrieve_password
    else 
      flash[:notice] = "Sorry, there is no account with that email"
      render :retrieve_password
    end
  end

  def retrieve_password
    @user = User.find_by(email: params[:email])
    if @user == nil || params[:security_answer] == ""
      flash[:notice] = "Sorry, your input was incorrect"
      render :retrieve_password
    else
      @user.security_answer && params[:security_answer]
      render :password
    end
  end

  def password
    @user = User.find_by(email: params[:email])
    if @user 
      @user.update(user_params)
      flash[:message] = "Password has been successfully reset"
      render :password
    else 
      flash[:notice] = "Sorry, some of the details don't match. Please try again"
      render :password
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :security_question, :security_answer)
  end 

  def find_user
    @user = User.find(params[:id])
  end
end
