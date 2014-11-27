class School < ActiveRecord::Base
  validates_presence_of :name, :address, :manager_name, :phone, :zip, :city, :country, :siret
  has_many :teacher_contracts
  has_many :teachers, through: :teacher_contracts

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
