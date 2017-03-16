class UsersController < ApplicationController
  before_action :authenticate_user!, :is_admin, only: [:index, :new, :edit, :destroy, :create, :show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path
  end

  def edit
  end

  def update
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end


  def show
    @user = User.find(params[:id])
    puts "user is #{@user.inspect}"
  end

  private

  def is_admin
    redirect_to(root_path) unless current_user.an_admin?
  end

  def user_params
    params.require(:user).permit(:email, :name, :block, :unit, :password, :an_admin)
  end

  def all_users
    @users = User.all
  end
end
