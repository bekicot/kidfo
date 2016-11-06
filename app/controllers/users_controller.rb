class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
		@family = @user.family_ids
	end
	
end
