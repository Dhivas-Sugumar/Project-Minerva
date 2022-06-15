class UsersController < ApplicationController
  before_action :is_admin? ,
                only: [ :admin_home, :admin_courses, :admin_categories, :admin_enrolls, :admin_reviews, :admin_users]


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

  # method for allowing admins to view and edit users.
  def admin_users
    set_user
    @users = User.all
    render "users/admin/admin_users"
  end

  # method for allowing admins to view and edit courses.
  def admin_courses
    set_user
    @courses = Course.all
    render "users/admin/admin_courses"

  end

  # method for allowing admins to view and edit categories.
  def admin_categories
    set_user
    @categories = Category.all
    render "users/admin/admin_categories"

  end

  # method for allowing admins to view and edit enrolls.
  def admin_enrolls
    set_user
    @enrolls = Enroll.all
    render "users/admin/admin_enrolls"

  end

  # method for allowing admins to view and edit reviews.
  def admin_reviews
    set_user
    @reviews = Review.all
    render "users/admin/admin_reviews"

  end




  private

  def user_params
    params.require(:user).permit( :avatar)
  end

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def is_admin?
    set_user
    redirect_to root_path unless current_user.admin?
  end


  #setups all the variables for the admin dashboard.
  def admin_setup
    @courses = Course.all
    @users = User.all
    @categories = Category.all
    @enrolls = Enroll.all
    @reviews = Review.all
  end



end
