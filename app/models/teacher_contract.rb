class TeacherContract < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :school
end
