class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    # added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :avatar]
    # devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    # devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    # devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation,
                                                               :first_name, :last_name, :avatar) }

    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:username, :password) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :email, :password, :current_password,
                                                                      :password_confirmation,
                                                                      :first_name, :last_name, :avatar)}
  end


end
