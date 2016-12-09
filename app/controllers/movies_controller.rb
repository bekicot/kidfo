class MoviesController < ApplicationController
  def new


    @kid = Kid.find(params[:kid_id])
    @movie = @kid.favorites.new
    @favorites = @kid.favorites.all
    @favorite = Favorite.new

    tmdb_api_key = ENV["TMDB_API_KEY"]

    i = Tmdb::Api.key(tmdb_api_key)
    
    if params[:title]
      i = Tmdb::Movie.search(params[:title])
    end
    # i = Tmdb::Find.search(params[:title])
    #i = Tmdb::Movie.upcoming
    @configuration = Tmdb::Configuration.new

    @movies = []
    @moviesearch = []
    if params[:title]
      i.each do |result|
        mv = result
        if !mv.adult 
          @moviesearch << mv
          @movies << Favorite.new
        end
    end
    end

  end

  def create
    @kid = Kid.find(params[:kid_id])
    # Prevent Duplicate Movies
    @movie_names = @kid.favorites.pluck(:description)
    @newmoviename = movie_params[:description]
    @kid.favorites.create(movie_params.merge(kid_id: @kid.id))
    redirect_to kid_path(@kid)
    end

  def destroy
  end

  private

  def movie_params
    params.require(:favorite).permit(:type, :name, :description, :image_link, :book_isbn, :releasedate, :movie_cast, :movie_trailer_url, :category)
  end
end
