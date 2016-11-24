class BooksController < ApplicationController
  def new
    @kid = Kid.find(params[:kid_id])
    @favorites = @kid.favorites.all
    @favorite = Favorite.new
    @book = @kid.favorites.new
    searchquery = params[:name]
    @booksearch = GoogleBooks.search(searchquery)
 end

  def index
    @kid = Kid.find(params[:kid_id])
    @favorites = @kid.favorites.all
    @favorite = Favorite.new
    @book = @kid.favorites.new
    searchquery = params[:title]
    @booksearch = GoogleBooks.search(searchquery)
    end

  def create
    @kid = Kid.find(params[:kid_id])
    # Prevent Duplicate Books
    @book_isbns = @kid.favorites.pluck(:book_isbn)
    @newfavoriteisbn = book_params[:book_isbn]
    if @book_isbns.include? @newfavoriteisbn
      redirect_to new_kid_book_path(@kid), alert: 'This is already a favorite book!'
    else
      @kid.favorites.create(book_params.merge(kid_id: @kid.id))
      redirect_to kid_path(@kid)
    end
  end

  def destroy
  end

  private

  def book_params
    params.require(:favorite).permit(:type, :name, :description, :image_link, :book_isbn, :movie_cast, :movie_trailer_url, :category)
  end
end
