class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
  end

  def show
      @book = Book.find(params[:id])
      @newbook = Book.new
      @user = User.find_by(id: @book.user_id)
  end

  def new
      @user = current_user
      @book = Book.new
      @books = Book.all
  end

  def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      if
        @book.save
        flash[:notice] = '新規のBookが投稿されました。'
        redirect_to book_path(@book)

      else
        @user = current_user
        @book = Book.new
        redirect_to user_path(current_user.id)
      end
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
      book = Book.find(params[:id])
      book.update(book_params)
      flash[:notice] = 'Bookが更新されました。'
      redirect_to book_path(book)
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      flash[:notice] = 'Bookが削除されました。'
      redirect_to new_book_path
  end

  def about
  end



  private
      def book_params
        params.require(:book).permit(:title, :opinion, :user_id)
      end
      def correct_user
       book = Book.find(params[:id])
      end
end
