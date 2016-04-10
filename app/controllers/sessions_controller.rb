class SessionsController < ApplicationController
  before_action :current_user

  def new
  	@user = User.new
  	render "new"
  end

  def create
  	user_params = params.require(:user).permit(:email, :password)
  	@user = User.confirm(user_params)
  	
  	if @user
  		log_in(@user)
      flash[:notice] = "Successfully logged in."
  		redirect_to @user
  	else
      flash[:error] = "Incorrect email or password."
  		redirect_to login_path
  	end
  end

  def destroy
  	logout
    flash[:notice] = "You have successfully logged out."
  	redirect_to root_path
  end

end
