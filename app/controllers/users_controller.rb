class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]
  before_action :current_user
  # before_filter :redirect_unauthenticated, except: [:show]

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		log_in @user
  		flash[:success] = "Welcome to the ArtsxTech Job Board."
			redirect_to @user
		else
			render "new"
		end
  end

  def show
  	user_id = params[:id]
  	@user = User.find_by_id(user_id)
  	render "show"
  end

  def edit
  	user_id = params[:id]
  	@user = User.find(user_id)
  end

  def update
  	user_id = params[:id]
  	@user = User.find(user_id)
  	if @user.update_attributes(user_params)
  		flash[:success] = "Profile updated."
  		redirect_to @user
  	else
  		render "edit"
  	end
  end

  def destroy
  	User.find(params[:id]).destroy
  	redirect_to new_user_path
  end

  private

  def admin_user
  	redirect_to(root_path) unless current_user.admin?
  end

  # def set_user
  # 	@user = User.find(params[:id])
  # end

  def user_params
  	params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
