class RenameColumnToAvailabilities < ActiveRecord::Migration
  def change
        remove_column :availabilities, :hour_begin
        remove_column :availabilities, :hour_end
        remove_column :availabilities, :day
        add_column :availabilities, :starts_at, :datetime
        add_column :availabilities, :ends_at, :datetime
  end
end
