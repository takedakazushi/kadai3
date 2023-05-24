class BooksController < ApplicationController
  before_action :authenticate_user!, 
  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end
  def new
    @books = Book.new
  end
  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
    redirect_to books_path
   else
    render :index
   end
  end

  def show
    @book = Book.all
  end
   def update
    flash[:notice] = "Book was successfully created"
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id)
    else
       render :edit
    end
   end 

  def edit
  end
  # 投稿データのストロングパラメータ
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  def show
    @books=Book.all
    @book=Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
