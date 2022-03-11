class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      flash[:success] = "Infomation has been added"
      redirect_to users_path 
    else
      flash.now[:danger] = "Infomation has not been added"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Infomation has been updated"
      redirect_to @user 
    else
      flash.now[:danger] = "Infomation has not been updated"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = "Information has been deleted."
      redirect_to users_path 
    end
  end

  protected
  def resource_not_found
    message = "The information you are looking for could not be found" 
    flash[:alert] = message
    redirect_to root_path
  end

  private
  def set_user
    @user = User.find(params[:id])
    end

  def user_params
  params.require(:user).permit(:first, :last, :phone, :email) 
  end
end
