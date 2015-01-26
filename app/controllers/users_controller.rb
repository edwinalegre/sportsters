class UsersController < ApplicationController

	def index
		@user = User.find(params[:id])
	end

	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))

		if @user.save
      		flash[:success] = "Account successfully created! Please login."
			redirect_to login_path
		else
      		flash.now[:danger] = @user.errors.full_messages.to_sentence
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))
      		flash[:success] = "User details successfully saved!"
			redirect_to user_path
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id])
    
    	@user.destroy
    
      	flash[:danger] = "User has been deleted!"
    	redirect_to admins_path
	end

end