class SportstersController < ApplicationController
	
	def index
		@user = User.find(session[:user_id])
		@sportsters = @user.sportsters
	end

	def show
		@user = User.find(session[:user_id])
		@sportster = Sportster.find(params[:id])
	end

	def new
		@user = User.find(session[:user_id])
		@sportster = Sportster.new
	end

	def create
		@user = User.find(session[:user_id])
		@sportster = Sportster.new(params.require(:sportster).permit(:first_name, :last_name, :age, :birth_date, :profile_image, :division, :shirt_size, :short_size))
		@sportster.user_id = @user.id
		@sportster.save

		if @sportster.save
			redirect_to sportsters_path
		else
			render :new
		end
	end

	def edit
		@sportster = Sportster.find(params[:id])
	end

	def update
		@sportster = Sportster.find(params[:id])

		if @sportster.update(params.require(:sportster).permit(:first_name, :last_name, :age, :birth_date, :profile_image, :division, :shirt_size, :short_size))
			redirect_to sportster_path
		else
			render :edit
		end
	end

	def destroy
	end
end