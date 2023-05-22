class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
   @user = User.find(params[:id])
   @User = @user.users/edit
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
