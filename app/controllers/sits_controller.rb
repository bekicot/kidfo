class SitsController < ApplicationController

	def new
	    @sit = Sit.new
	end

	def create
		@sit = current_user.family.sits.create(sit_params)
		if @sit.valid?
      		redirect_to user_path(current_user)
    	else
     	    render :new, status: :unprocessable_entity
   		end
	end

	private

	def sit_params
    	params.require(:sit).permit(:family_id, :paid, :rate, :status, :sit_details, :sit_start, :sit_end)
  	end

end
