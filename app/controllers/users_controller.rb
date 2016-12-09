class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @family = @user.family
    @families = @user.families
  end
end
