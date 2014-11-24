class School < ActiveRecord::Base
  has_many :teachers, through: :teacher_contracts
end
