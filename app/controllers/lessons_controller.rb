class LessonsController < InheritedResources::Base

  def create
      lesson = current_learner.lessons.build(lesson_params)
      teacher_id = params[:teacher_id]
      if lesson.find_availability_for_teacher(teacher_id)
        lesson.save
        redirect_to learner_path(current_learner)
      else
        flash[:error] = "Sa marsh pa lol NEGER"
        redirect_to learner_path(current_learner)
      end
  end


  private

    def lesson_params
      params.require(:lesson).permit(:starts_at, :ends_at, :availability_id)
    end
end
