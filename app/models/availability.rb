class Availability < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :availability
end
