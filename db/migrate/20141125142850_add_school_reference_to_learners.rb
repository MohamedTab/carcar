class AddSchoolReferenceToLearners < ActiveRecord::Migration
  def change
    add_reference :learners, :school, index: true
  end
end
