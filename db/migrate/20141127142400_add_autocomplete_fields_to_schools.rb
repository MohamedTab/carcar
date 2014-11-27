class AddAutocompleteFieldsToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :street_number, :string
    add_column :schools, :route, :string
    add_column :schools, :locality, :string
    add_column :schools, :administrative_area_level_1, :string
    add_column :schools, :postal_code, :string
  end
end

