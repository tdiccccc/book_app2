class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), success: 'You have created book successfully.'
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end
  
  def edit
  end

  def show
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def current_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to books_path unless @user == current_user
  end
end
