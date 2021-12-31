class WelcomeController < ApplicationController
  def index
    @enrolls = Enroll.all
    @courses = Course.all
    @categories = Category.all
    @users = User.all
  end
end
