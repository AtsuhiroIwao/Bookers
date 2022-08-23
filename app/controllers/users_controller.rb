class UsersController < ApplicationController
  def show
  @user=User.find(params[:id])
  @new_book=Book.new
  @book=@user.books
  end

  def index
    @users=User.all
    @user=current_user
    @book=Book.new
  end

  def edit
  @user=User.find(params[:id])
    unless current_user.id  ==  @user.id
      redirect_to user_path(current_user.id)
    end

  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id),flash:{notice:'You have updated user successfully.'}
    else
    render:edit
    end
  end
  private
  def user_params
    params.require(:user).permit(:introduction, :profile_image, :name)
  end
end
