class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :remember_me) }
  end

  def after_sign_in_path_for(resource)
    student_path(current_student)
  end

  protect_from_forgery with: :exception
end
