class AdminsController < ApplicationController

	def index
	 	if params[:search_sportsters] && params[:search_sportsters] != ''
	   		reg = ".*" + params[:search_sportsters] + ".*"
	   		@sportsters = Sportster.where(params[:field].to_sym => /#{reg}/i)
	  	else
	    	@sportsters = Sportster.none
	    end
	 	if params[:search_users] && params[:search_users] != ''
	   		reg = ".*" + params[:search_users] + ".*"
	   		@users = User.where(params[:field].to_sym => /#{reg}/i)
	  	else
	    	@users = User.none
	    end
	end

	def show
	end

end