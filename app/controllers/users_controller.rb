class UsersController < ApplicationController
  before_action :authenticate_user!
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
    @user = User.find(params[id])
    if @user.update(user_params)
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
