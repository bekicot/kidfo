class InviteController < ApplicationController

	def index
		@q = User.ransack(params[:q])
 	    @searchresults = @q.result(distinct: true)
	end

end
