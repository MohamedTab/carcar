class School < ActiveRecord::Base
  validates_presence_of :name, :address, :manager_name, :phone, :siret, :street_number, :route, :locality, :postal_code, :country, :administrative_area_level_1
  validates_uniqueness_of :siret, :phone
  has_many :teacher_contracts
  has_many :teachers, through: :teacher_contracts

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
