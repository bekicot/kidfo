class RelationshipsController < ApplicationController

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



 private

  def relationship_params
    params.require(:relationship).permit(:nature, :person_id, :created_at)
  end

end
