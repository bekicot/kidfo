class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    @kid = Kid.find(params[:kid_id])
    @favorites = @kid.favorites.all
  end

  def new
    @kid = Kid.find(params[:kid_id])
    @favorites = @kid.favorites.all
    @favorite = Favorite.new
  end

  def show
    @kid = Kid.find(params[:kid_id])
    @favorites = @kid.favorites.all
  end

  def create
    @kid = Kid.find(params[:kid_id])
    # Prevent Duplicate Foods
    @kid.favorites.create(favorite_params.merge(kid_id: @kid.id))
    redirect_to kid_path(@kid)
  end

  def destroy
    @kid = Kid.find(params[:kid_id])
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to kid_path(@kid)
  end

  private

  def favorite_params
    params.require(:favorite).permit(:type, :name, :description, :image_link, :book_isbn, :movie_cast, :releasedate, :movie_trailer_url, :category)
  end
end
