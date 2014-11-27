class LessonsController < InheritedResources::Base

  private

    def lesson_params
      params.require(:lesson).permit(:starts_at, :ends_at)
    end
end

