class LessonsController < InheritedResources::Base

  def create
    availability = Availability.find_by(teacher_id: params[:id])
    if params[:lesson][:starts_at] > availability.starts_at && params[:lesson][:ends_at] < availability.ends_at
      current_learner.lessons.create(lesson_params)
      redirect_to learner_path(current_learner)
    else

    # AJOUTER MESSAGE DERREUR

      redirect_to learner_path(current_learner)
    end
  end

  private

    def lesson_params
      params.require(:lesson).permit(:starts_at, :ends_at)
    end
end
