class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end
    

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    if book.update(book_params)
      flash[:notice] = "Book was successfully updated."
    end
    redirect_to "/books/#{book.id}"
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
    end
    redirect_to "/books"
    
  end
  
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  

end
