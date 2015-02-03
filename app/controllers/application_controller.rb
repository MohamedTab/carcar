class ApplicationController < ActionController::Base
     # before_action :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception




private


 # def after_sign_in_path_for(learner)
 #    learner_path(learner)
 #  end


  #   def after_sign_in_path_for(teacher)
  #   teacher_path(teacher)
  # end

end
