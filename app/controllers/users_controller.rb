class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
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


  private

  def user_params
    params.require(:user).permit( :avatar)
  end
end
