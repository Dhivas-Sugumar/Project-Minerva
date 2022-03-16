class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @enrolls = User.find(current_user.id).enrolls
    else
      @enrolls = nil
    end
    @courses = Course.all
    @categories = Category.all
  end
end
