class Teacher < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :teacher_contracts
  has_many :schools, through: :teacher_contracts

  validates :email, uniqueness: true

  def in_school?(school)
    # school.teachers.include? self
    if school
      self.schools.include? school
    else
      false
    end
  end
end
