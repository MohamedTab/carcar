class LessonsController < InheritedResources::Base

  def create
    current_learner.lessons.create(lesson_params)
    redirect_to learner_path(current_learner)
  end

  private

    def lesson_params
      params.require(:lesson).permit(:starts_at, :ends_at)
    end
end

