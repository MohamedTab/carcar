class AddInfoToLearners < ActiveRecord::Migration
  def change
    add_column :learners, :firs_name, :string
    add_column :learners, :last_name, :string
    add_column :learners, :date_of_birth, :date
    add_column :learners, :phone, :string
    add_column :learners, :address, :string
    add_column :learners, :city, :string
    add_column :learners, :zip, :string
    add_column :learners, :country, :string
  end
end
