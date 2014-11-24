class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy,]
  def index
    @schools = School.all
  end

  def show
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
  end

  def edit
  end

  def update
  end

  private

  private
    def set_school
      @school = school.find(params[:id])
    end

    def school_params
      params.require(:school).permit(:name, :address, :manager_name, :phone)
    end
end