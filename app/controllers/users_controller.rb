class UsersController < ApplicationController
  before_action :is_admin? ,only: %i[ admin_home]


  def index
    @users = User.all
  end

  def show
    set_user
  end

  def edit
    set_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      format.html { redirect_to user_path(@user), notice: "User was successfully updated." }
      format.json { render :show, status: :ok, location: @enroll }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @enroll.errors, status: :unprocessable_entity }
    end

  end

  #controller for admin user's main dashboard
  def admin_home
    set_user
    admin_setup
    render "users/admin/admin_home"


  end


  private

  def user_params
    params.require(:user).permit( :avatar)
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end

  #setups all the variables for the admin dashboard.
  def admin_setup
    @courses = Course.all
    @users = User.all
    @categories = Category.all
    @enrolls = Enroll.all
    @reviews = Review.all
  end

  def is_admin?
    set_user
    @user.admin?
  end

end
