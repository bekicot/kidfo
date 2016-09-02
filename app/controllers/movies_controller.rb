class MoviesController < ApplicationController

	def index
		    @kid = Kid.find(params[:kid_id])
        @movie = @kid.movies.new
	      i = Imdb::Search.new(params[:title])
  	     @movies = []
  	     @moviesearch = []
  	     if params[:title]
  		  i.movies[0..5].each do |result|
  		 	 mv = result
    	 	 @moviesearch << mv
    	 	 @movies << Movie.new
  		  end
  		end
  end

    def create
    	@kid = Kid.find(params[:kid_id])
      @kid.movies.create(movie_params.merge(:kid_id => @kid.id))
      redirect_to kid_path(@kid)
    end

    def destroy

    end

    private

	def movie_params
		params.require(:movie).permit(:title, :cast_characters,:company, :mpaa_rating, :trailer_url, :poster)
	end

end
