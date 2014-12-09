class TeachersController < ApplicationController
    before_action :set_school, only: [:show, :edit, :update, :destroy]
  def index
    @teachers = Teacher.all
  end

  def create
    @school = School.find(params[:school_id])
    @teacher = @school.teacher.new(params[:teacher])
    @teacher.save
    redirect_to teachers_path
  end

  def update
    @teacher.update(teacher_params)
    redirect_to teachers_path
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


