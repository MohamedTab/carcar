class AddAddressZipCityToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :address, :string
    add_column :teachers, :city, :string
    add_column :teachers, :zip, :string
  end
end
