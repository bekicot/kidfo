class KidsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
  end

  def new
    @kid = Kid.new
  end

  def create
    @kid = current_user.family.kids.create(kid_params)
    if @kid.valid?
      redirect_to kid_path(@kid)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @kid = Kid.find(params[:id])
    @favorites = @kid.favorites.all
    @favorite = Favorite.new
  end

  def edit
    @kid = Kid.find(params[:id])
  end

  def update
    # We should find the record the user wants to update.
    # We should update this record and save the changes the user specifies into our database.
    # We should send the user back to the root page.

    @kid = Kid.find(params[:id])

    @kid.update_attributes(kid_params)

    if @kid.valid?
      redirect_to kid_path(@kid)
    else
      render :new, status: :unprocessable_entity
     end
  end

  def destroy
    @kid = Kid.find(params[:id])

    if @kid.family.parents.exists?(current_user)
      @kid.destroy
      redirect_to user_path
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  private

  def kid_params
    params.require(:kid).permit(:user_id, :name, :birthdate, :gender, :avatar, :bedtime, :sleeproutine, :allergies, :chores, :nonos)
  end
end
