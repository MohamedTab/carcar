class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  def index
    if params[:locality]
      @schools = School.where({ locality: params[:locality] })
    else
      @schools = School.order("created_at DESC")
    end
    @markers = Gmaps4rails.build_markers(@schools) do |school, marker|
      marker.lat school.latitude
      marker.lng school.longitude
    end
  end

  def show
    @teachers = Teacher.all
    @markers = Gmaps4rails.build_markers([@school]) do |school, marker|
      marker.lat school.latitude
      marker.lng school.longitude
    end
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      redirect_to schools_path
    else
      render :new
    end
  end

  def destroy
    @school.destroy
    redirect_to schools_path
  end

  def edit
  end

  def update
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

  def dashboard
    @school = School.find(params[:school_id])
    @teachers = @school.teachers
  end

  private

  private
    def set_school
      @school = School.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:name, :address, :manager_name, :phone, :siret, :picture, :street_number, :route, :locality, :postal_code, :country, :administrative_area_level_1)
    end
end