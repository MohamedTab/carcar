class LearnersController < ApplicationController
    before_action :set_learner, only: [:show, :edit, :update, :destroy]
  def index

  end

  def new
    @learner = Learner.new
  end

  def create
    @learner = learner.new(params[:learner])
    @learner.save
    redirect_to learners_path
  end

  def show
    # @learner = current_user.id
    @learner = Learner.find(params[:id])
    @schools = School.all
    @hours = ["06:00 - 07:00","07:00 - 08:00","08:00 - 09:00","09:00 - 10:00","10:00 - 11:00","11:00 - 12:00", "12:00 - 13:00", "13:00 - 14:00", "14:00 - 15:00", "15:00 - 16:00", "16:00 - 17:00", "17:00 - 18:00", "18:00 - 19:00", "19:00 - 20:00", "20:00 - 21:00", "21:00 - 22:00", "22:00 - 23:00"]
    @lessons = Lesson.all
    @teachers = @learner.school.teachers
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def add_school
    @learner = Learner.find(params[:id])
  end

  def update_add_school
    @learner = Learner.find(params[:id])
    school = params[:learner][:school_id]
    @learner[:school_id] = school
    @learner.save
    redirect_to learner_path(@learner)
  end

  private
  def set_learner
    @learner = Learner.find(params[:id])
  end

  def learner_params
   params.require(:learner).permit(:first_name, :last_name)
  end
end
