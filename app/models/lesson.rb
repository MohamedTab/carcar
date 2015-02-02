class Lesson < ActiveRecord::Base
  belongs_to :learner
  belongs_to :availability
  has_many :lessons

  def find_availability_for_teacher(teacher_id)
     availability = Availability.where(["teacher_id = ? and starts_at <= ? and ends_at >= ?", teacher_id, self.starts_at, self.ends_at]).last
     self.availability_id = availability.id if availability
     availability
  end

  after_create :send_booking_confirmation_email

  private

  def send_booking_confirmation_email
    LearnerMailer.booking_confirmation(learner).deliver
  end

end
