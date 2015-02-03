class LessonsController < InheritedResources::Base

  def create
    if learner_signed_in?
      lesson = current_learner.lessons.build(lesson_params)
      teacher_id = params[:teacher_id]
      if lesson.find_availability_for_teacher(teacher_id)
        lesson.save
        redirect_to learner_path(current_learner)
      else
        flash[:error] = "ERROR"
        redirect_to learner_path(current_learner)
      end
    elsif teacher_signed_in?

      lesson = Lesson.new(lesson_params)

      if lesson.find_availability_for_teacher(teacher_id)
        lesson.save
        redirect_to learner_path(current_learner)
      else
        flash[:error] = "ERROR"
        redirect_to teacher_path(current_teacher)
      end

    else
      if lesson.find_availability_for_teacher(teacher_id)
        lesson.save
        redirect_to  school_dashboard_path
      else
        flash[:error] = "ERROR"
        redirect_to school_dashboard_path(current_learner)
      end
    end
  end

  def destroy
    lesson = Lesson.find(params[:id])
    lesson.destroy
    redirect_to learner_path(current_learner)
  end

  def edit
    @lesson = Lesson.find(params[:id])
  end

  private

    def lesson_params
      params.require(:lesson).permit(:starts_at, :ends_at, :availability_id)
    end
end
