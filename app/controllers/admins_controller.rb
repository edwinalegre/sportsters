class AdminsController < ApplicationController

	def index
		# Search list of sportster participants using the drop down categories name and division
	 	if params[:search_sportsters] && params[:search_sportsters] != ''
	 		reg = ".*" + params[:search_sportsters] + ".*"
	 		@sportsters = Sportster.where(params[:field].to_sym => /#{reg}/i)
		else
	  	@sportsters = Sportster.all.limit(10)
	  end
		# Search list of users using the drop down categories name
	 	if params[:search_users] && params[:search_users] != ''
	   	reg = ".*" + params[:search_users] + ".*"
	   	@users = User.where(params[:field].to_sym => /#{reg}/i)
	  else
	    @users = User.all.limit(10)
	  end
	end

	def show
	end

end
