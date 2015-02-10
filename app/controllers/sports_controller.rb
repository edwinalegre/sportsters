class SportsController < ApplicationController
	# Search and display list of sports and sportster participants using the drop down categories name and division
	def index
	 	if params[:search_sports] && params[:search_sportsters] != ''
   		reg = ".*" + params[:search_sports] + ".*"
   		@sports = Sport.where(params[:field].to_sym => /#{reg}/i)
  	else
    	@sports = Sport.all.limit(10)
    end
	end
	def show
		@sport = Sport.find(params[:id])
	end

	# Admin creates a new sport for the season and year based on the type to be played
	def new
		@sport = Sport.new
	end
	def create
		@sport = Sport.new(params.require(:sport).permit(:year, :type, :division, :status))
		if @sport.save
			redirect_to sports_path
		else
			render :new
		end
	end

end
