class ProfilesController < ApplicationController

	def show
		@profile = Profile.find(params[:id])
	end

	def new
		@user = User.find(session[:user_id])
		@profile = Profile.new
	end

	def create
		@user = User.find(session[:user_id])
		@profile = Profile.new(params.require(:profile).permit(:phone, :mobile_phone, :alternate_email, :address1, :address2, :city, :state, :zip, :country))
		@profile.user_id = @user.id
		@profile.save

		if @profile.save
			redirect_to profile_path(@profile)
		else
			render :new
		end
	end

	def edit
		@profile = Profile.find(params[:id])
	end

	def update
		@profile = Profile.find(params[:id])

		if @profile.update(params.require(:profile).permit(:phone, :mobile_phone, :alternate_email, :address1, :address2, :city, :state, :zip, :country))
			redirect_to profile_path
		else
			render :edit
		end
	end
end