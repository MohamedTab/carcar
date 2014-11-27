class RemoveCityZipFromSchools < ActiveRecord::Migration
  def change
    remove_column :schools, :zip
    remove_column :schools, :city
  end
end
