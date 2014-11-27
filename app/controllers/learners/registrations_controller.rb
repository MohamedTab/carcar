class Learners::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :firs_name, :last_name, :date_of_birth, :phone, :address, :city, :zip, :country, :password, :picture) }
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :firs_name, :last_name, :date_of_birth, :phone, :address, :city, :zip, :country, :password, :picture) }
  end

  def after_sign_up_path_for(learner)
    learner_path(learner)
  end

  def after_sign_in_path_for(learner)
    learner_path(learner)
  end
end
