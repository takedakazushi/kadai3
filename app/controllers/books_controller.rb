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
    render :new
   end
  end

  def show
    @book = Book.all
  end

  def edit
  end
  # 投稿データのストロングパラメータ
  def destroy
    book = 削除するBookレコードを取得
    book.削除
    redirect_to Bookの一覧ページへのパス
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
