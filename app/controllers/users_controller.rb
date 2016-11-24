class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @family = @user.family
    @families = @user.families
  end
end
