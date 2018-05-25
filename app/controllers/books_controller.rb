class BooksController < ApplicationController
  def index
  end

  def show
      @book = Book.find(params[:id])
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
      if @book.save
        flash[:notice] = 'Book was successfully created.'
        redirect_to book_path(@book)

      else
        @book = Book.new
        @books = Book.all
        render :new
      end
  end

  def edit
      @book = Book.find(params[:id])
  end

  def update
      book = Book.find(params[:id])
      book.update(book_params)
      redirect_to book_path(book)
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to new_book_path
  end

  def about
  end

  private
      def book_params
        params.require(:book).permit(:title, :opinion, :user_id)
      end
end
