class School < ActiveRecord::Base
  validates_presence_of :name, :address, :manager_name, :phone, :zip, :city, :country, :siret
  has_many :teachers, through: :teacher_contracts
end
