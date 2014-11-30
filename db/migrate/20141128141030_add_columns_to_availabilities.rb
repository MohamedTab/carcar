class AddColumnsToAvailabilities < ActiveRecord::Migration
  def change
        add_reference :availabilities, :teacher, index: true
  end
end
