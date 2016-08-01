class Admin::UsersController < ApplicationController
  before_action :get_role, only: [:new]

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "flash.user_created"
      redirect_to root_path
    else
      get_role
      flash[:danger] = t "flash.user_notcreated"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email, :role,
      :password, :password_confirmation
  end

  def get_role
    @roles = User.roles.keys.reject {|a| a == "admin"}
  end
end
