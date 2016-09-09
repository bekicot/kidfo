class MoviesController < ApplicationController

	def new
        @kid = Kid.find(params[:kid_id])
        @movie = @kid.favorites.new
        @favorite = Favorite.new
        i = Imdb::Search.new(params[:title])
         @movies = []
         @moviesearch = []
         if params[:title]
            i.movies[0..5].each do |result|
               mv = result
               @moviesearch << mv
               @movies << Favorite.new
            end
         end
  end

  def index
		    @kid = Kid.find(params[:kid_id])
        @movie = @kid.favorites.new
	      i = Imdb::Search.new(params[:title])
  	     @movies = []
  	     @moviesearch = []
  	     if params[:title]
  		  i.movies[0..5].each do |result|
  		 	 mv = result
    	 	 @moviesearch << mv
    	 	 @movies << Favorite.new
  		  end
  		end
  end

  def create
    	@kid = Kid.find(params[:kid_id])
      #Prevent Duplicate Movies
      @movie_names = @kid.favorites.pluck(:description)
      @newmoviename = movie_params[:description]
      @kid.favorites.create(movie_params.merge(:kid_id => @kid.id))
      redirect_to kid_path(@kid)
      
  end

  def destroy

  end

  private

	def movie_params
    params.require(:favorite).permit(:type, :name,:description, :image_link, :book_isbn, :movie_cast, :movie_trailer_url, :category)
  end

end
