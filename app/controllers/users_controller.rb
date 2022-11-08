class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
    
  def create
   @user = User.new(user_params)
   @user.save
   @user.user_id = current_user.id
   redirect_to 'books/index'
  end
  
  def index
    @user  = User.all
    @books = Book.all
  end
  
  def show
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
  
  
end
