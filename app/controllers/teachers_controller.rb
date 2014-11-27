class TeachersController < ApplicationController
    before_action :set_school, only: [:show, :edit, :update, :destroy,]
  def index
    @teachers = Teacher.all
  end

  def create
    @school = School.find(params[:school_id])
    @teacher = @school.teacher.new(params[:teacher])
    @teacher.save
    redirect_to teachers_path
  end

  def show
    @hours = ["06:00 - 07:00","07:00 - 08:00","08:00 - 09:00","09:00 - 10:00","10:00 - 11:00","11:00 - 12:00", "12:00 - 13:00", "13:00 - 14:00", "14:00 - 15:00", "15:00 - 16:00", "16:00 - 17:00", "17:00 - 18:00", "18:00 - 19:00", "19:00 - 20:00", "20:00 - 21:00", "21:00 - 22:00", "22:00 - 23:00"]
  end

  def update
  end

  def destroy
  end

  private

  def set_school
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:name)
  end
end
