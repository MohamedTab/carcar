class Availability < ActiveRecord::Base
  has_many :lessons
  belongs_to :teacher

  def lesson_booked?(starts_at, ends_at)
    self.lessons.where(starts_at: starts_at, ends_at: ends_at).any?
  end
end
