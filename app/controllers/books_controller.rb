class BooksController < ApplicationController
  def index
    @books = Book.all
    @user = current_user
  end
  def new
    @books = Book.new
  end
  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
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
   def create
    @book = book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :new
    end
   end
  private

  def book_params
    params.require(:book).permit(:shop_name, :image, :caption)
  end
end
