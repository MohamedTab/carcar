class Learner < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #has_many :teachers, through: :lessons
  has_many :lessons
  belongs_to :school

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  after_create :send_welcome_email

  private

    def send_welcome_email
      LearnerMailer.welcome(self).deliver
    end
end

