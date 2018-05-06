class BooksController < ApplicationController
  def index
    # your code here
    @books = Book.all
    render :index
  end

  def new
    # your code here
  end

  def create
    # your code here
    redirect_to books_url
    book = Book.new(book_params)
    book.save
  end

  def destroy
    # your code here
    book_to_destroy = Book.find(params[:id])
    book_to_destroy.destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
