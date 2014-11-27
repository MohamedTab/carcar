class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  def index
    @schools = School.all
  end

  def show
    @teachers = Teacher.all
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    @school.save
    redirect_to schools_path
  end

  def destroy
    @school.destroy
    redirect_to schools_path
  end

  def edit
  end

  def update
    @school.update(school_params)
    redirect_to schools_path
  end

  def add_teachers
    @school = School.find(params[:school_id])
    @teachers = Teacher.all
  end

  def create_contract
    @school = School.find(params[:school_id])
    if params[:teachers]
      @school.teachers.delete_all

      params[:teachers].each do |teacher_id|
        teacher = Teacher.find(teacher_id)
        @school.teachers << teacher
      end
    else
      @school.teachers.delete_all
    end
    redirect_to school_path(@school)
  end

  private

  private
    def set_school
      @school = School.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:name, :address, :manager_name, :phone, :zip, :city, :country, :siret, :school_id, :picture)
    end
end