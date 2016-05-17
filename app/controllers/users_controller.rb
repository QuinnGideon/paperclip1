class UsersController < ApplicationController
  def index
  	@user = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], avatar: params[:user][:avatar])
  	if @user.save
      flash[:notice] = "You are now part of the club!!"
      redirect_to "/users"

    else
      flash[:notice] = "There was an error creating your account."
    end

  end

  def update
	end 

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
    	flash[:notice] = "User deleted successfully."
  	else
    	flash[:alert] = "There was a problem deleting the user."
		end
  		redirect_to "/users"
	end
end
