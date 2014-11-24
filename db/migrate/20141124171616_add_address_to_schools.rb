class AddAddressToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :city, :string
    add_column :schools, :zip, :string
    add_column :schools, :country, :string
    add_column :schools, :siret, :string

  end
end
