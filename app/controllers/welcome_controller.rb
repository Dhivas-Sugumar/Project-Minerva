class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      @enrolls = User.find(current_user.id).enrolls
    else
      @enrolls = nil
    end
    @courses = Course.all.filter_by_draft(false).order("RANDOM()").limit(20)
    @categories = Category.all
  end
end
