class AddAttachmentPictureToSchools < ActiveRecord::Migration
  def self.up
    change_table :schools do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :schools, :picture
  end
end
