class Teachers::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :zip, :address, :city, :picture) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :name, :zip, :address, :city, :picture) }
  end

  def after_sign_up_path_for(teacher)
    teacher_path(teacher)
  end

  def after_sign_in_path_for(teacher)
    teacher_path(teacher)
  end
end
