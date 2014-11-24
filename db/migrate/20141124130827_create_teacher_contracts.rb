class CreateTeacherContracts < ActiveRecord::Migration
  def change
    create_table :teacher_contracts do |t|
      t.references :teacher, index: true
      t.references :school, index: true

      t.timestamps
    end
  end
end
