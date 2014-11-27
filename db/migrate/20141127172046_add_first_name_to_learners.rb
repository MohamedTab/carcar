class AddFirstNameToLearners < ActiveRecord::Migration
  def change
    rename_column :learners, :firs_name, :first_name
  end
end
