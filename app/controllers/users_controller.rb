class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
   @user = User.find(params[:id])

  end
  def index
    @user = current_user
    @users = User.all
  end
  def update
    flash[:notice] = "Book was successfully created"
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end


  private
  def correct_user
     @user = User.find(params[:id])
     if @user != current_user
       redirect_to user_path(current_user.id)
     end
  end

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
