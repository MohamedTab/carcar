class LearnersController < ApplicationController
    before_action :set_learner, only: [:show, :edit, :update, :destroy]
  def index
    @learners = Learner.all
  end

  def new
    @learner = Learner.new
  end

  def create
    @learner = learner.new(params[:learner])
    @learner.save
    redirect_to schools_path
  end

  def show
    @learner = Learner.find(params[:id])
    @schools = School.all
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
