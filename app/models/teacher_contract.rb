class TeacherContract < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :school
  validates :school_id, :uniqueness => { :scope => :teacher_id }
end
