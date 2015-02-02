class CommentsController < ApplicationController

  def create
    # current_teacher.availabilities.create(availability_params)
    @comment = Comment.new(comment_params)
    # @comment[:teacher_id] = current_teacher.id
    @comment.save
    redirect_to teacher_path(current_teacher)
  end


  private

  def comment_params
    params.require(:comment).permit(:lesson_id, :description)
  end
end
