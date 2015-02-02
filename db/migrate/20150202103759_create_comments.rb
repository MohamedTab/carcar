class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :lesson, index: true
      t.string :description

      t.timestamps
    end
  end
end
