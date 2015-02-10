class SessionsController < ApplicationController

	def new
	end
	
	# Creates the session and authenticates the user
	def create
		@user = User.find_by(email: params[:user][:email])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id.to_s 
			redirect_to sportsters_path
		else
      flash.now[:danger] = "Please provide a valid email and password!"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path
	end

end
