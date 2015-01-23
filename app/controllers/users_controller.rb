class UsersController < ApplicationController

	def index
	end

	def show
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
	end

	def update
	end

	def destroy
	end

end