class LearnersController < ApplicationController
  def index
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
  end

  def edit
  end

  def destroy
  end

  def update
  end

  private

  def learner_params
   params.require(:learner).permit(:first_name, :last_name)
  end
end
