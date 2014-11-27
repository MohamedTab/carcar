class AddAttribusToLessons < ActiveRecord::Migration
  def change
    add_reference :lessons, :learner, index: true
    add_reference :lessons, :availability, index: true
  end
end
