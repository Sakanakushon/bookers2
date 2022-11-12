class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
    
  def create
   @user = User.new(user_params)
   @user.user_id = current_user.id
   @user.save
   redirect_to book_path(@book.id)
  end
  
  def index
    @book =Book.new
    @user = User.all
    @books = Book.all
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books= @user.books
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
     flash[:notice] = "You have updated user successfully."
     redirect_to user_path(current_user.id)
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  
end
