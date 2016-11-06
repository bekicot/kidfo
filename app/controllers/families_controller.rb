class FamiliesController < ApplicationController

	before_action :authenticate_user!, :only =>[:new, :create, :show, :destroy]

	def index
		@family = current_user.family
	end

	def new
		@family = Family.new
	end

	def create
		@family = current_user.families.create
	end

	def show
		@family = current_user.family
		@kids = current_user.kids.all
		@guardians = @family.guardians.all
	end


end
