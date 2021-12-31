class WelcomeController < ApplicationController
  def index
    @enrolls = Enroll.all
    @courses = Course.all
    @categories = Category.all
  end
end
