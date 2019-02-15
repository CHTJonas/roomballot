class UsersController < ApplicationController
  def index
    @users = User.accessible_by(current_ability, :read)
  end

  def edit
    @user = User.find(params[:id])
    authorize! :read, @user
  end

  def create
    authorize! :create, User
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    authorize! :update, @user
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    authorize! :read, @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :crsid, :year_group, :scholar, :jcr_president, :admin, :blocked)
  end
end
