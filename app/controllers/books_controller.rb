class BooksController < ApplicationController
  before_action :authenticate_user! 
	before_action :correct_user, only: [:edit, :update]


  def show
    @book = Book.find(params[:id])
		@user = @book.user
		@books =Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to @book, notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
   redirect_to books_path, notice: "successfully delete book!"
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def correct_user
    @book = Book.find(params[:id])
    # まず本を取り出した 重要
    @user = @book.user
    # 本に結びついたユーザーを取り出す
    if current_user != @user
      redirect_to books_path
    # 正しいユーザーではない場合本一覧に戻す
    end
  end
  
end
