class AddDatesToAvailabilities < ActiveRecord::Migration
  def change
    add_column :availabilities, :day, :integer
    add_column :availabilities, :hour_begin, :integer
    add_column :availabilities, :hour_end, :integer
  end
end
