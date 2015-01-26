class SportstersController < ApplicationController
	
	def index
		if session[:user_id]
			@user = User.find(session[:user_id])
			@sportsters = @user.sportsters
			@profile = @user.profile

		 	if params[:search_sportsters] && params[:search_sportsters] != ''
		   		reg = ".*" + params[:search_sportsters] + ".*"
		   		@sportsters_search = Sportster.where(params[:field].to_sym => /#{reg}/i)
		  	else
		    	@sportsters_search = Sportster.none
		    end
		else
			redirect_to root_path
		end
	end

	def show
		@user = User.find(session[:user_id])
		@sportster = Sportster.find(params[:id])

	    if params[:status] && params[:division]
	        @sports = Sport.where(status: params[:status],division: params[:division])
	    else
			@sports = Sport.all
	    end

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
      		flash[:success] = "Participant successfully added!"
			redirect_to sportster_path(@sportster)
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
      		flash[:success] = "Participant successfully saved!"
			redirect_to sportster_path
		else
			render :edit
		end
	end

	def destroy
		@sportster = Sportster.find(params[:id])
    
    	@sportster.destroy
    
      	flash[:danger] = "Participant has been deleted!"
    	redirect_to admins_path
	end
end