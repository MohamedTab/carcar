class AvailabilitiesController < ApplicationController
  def create
    # current_teacher.availabilities.create(availability_params)
    @availability = Availability.new(availability_params)
    @availability[:teacher_id] = current_teacher.id
    @availability.save
    redirect_to teacher_path(current_teacher)
  end


  private

  def availability_params
    params.require(:availability).permit(:starts_at, :ends_at)
  end
end
