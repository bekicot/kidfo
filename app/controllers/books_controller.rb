class BooksController < ApplicationController


	def index
         @kid = Kid.find(params[:kid_id])
		 @book = @kid.books.new
	     searchquery = params[:title]
	     @search = GoogleBooks.search(searchquery)
    end

    def create
        @kid = Kid.find(params[:kid_id])
    	@kid.books.create(book_params.merge(:kid_id => @kid.id))
    	redirect_to kid_path(@kid)
    end

    def destroy

    end


    private

	def book_params
		params.require(:book).permit(:title, :authors,:isbn, :description, :image_link)
	end

end
