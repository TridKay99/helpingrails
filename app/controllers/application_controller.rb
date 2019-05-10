class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def after_sign_in_path_for(resource)
    if resource.is_a?(Customer)
      current_customer_id = current_customer.id
      customer_path(current_customer_id)
    else
      current_worker_id = current_worker.id
      worker_path(current_worker_id)
    end
  end
  
  
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :firstname, :lastname, :experience, :description)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :firstname, :lastname, :experience, :description, :avatar, :username, :password_confirmation)}
  end
end
