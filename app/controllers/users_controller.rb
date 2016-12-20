class UsersController < ApplicationController
  before_action :find_user, only: [:show, :destroy]

  def index
    @users = User.all
  end

  def show
    @comment = @user.comments.new
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to user
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:login)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
